package com.ets.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.*;

import com.ets.service.*;
import com.ets.util.*;
import com.ets.entity.*;
@Controller
@RequestMapping("exam")
public class ExamController {
	@Resource
	private LessonService lService;
	@Resource
	private PaperService pService;
	@Resource
	private StuResultService srService;
	@Autowired
	private StudentService sService;
	//选择考试课程
	@RequestMapping("selectLesson")
	public String selectLesson(HttpSession session,ModelMap model){
		if(session.getAttribute("loginStudent")==null)
			return "redirect:../index.do";
		List<Lesson> lessons=lService.getAllLessons();
		model.put("lessons", lessons);
		return "selectLesson";
	}
	
	//选择考试试卷
	@RequestMapping("selectPaper")
	public String selectPaper(@RequestParam(value="id",required=true) int id,ModelMap model){
		Lesson lesson=lService.getLesson(id);
		List<Paper> papers=lesson.getPapers();
//		System.out.println("selectPaper papers.size="+papers.size());
		model.put("papers", papers);
		return "selectPaper";
	}
	
	//准备开始考试
	@RequestMapping("ready")
	public String ready(HttpServletRequest req){
		String id=req.getParameter("id");
		req.getSession().setAttribute("paperId", id);
		return "ready";
	}
	
	@RequestMapping("startExam")
	public String startExam(HttpSession session,ModelMap  model){
		if(session.getAttribute("loginStudent")==null)
			return "redirect:../index.do";
		String paperId=session.getAttribute("paperId").toString();
		if(paperId==null)
			return "redirect:../index.do";
		Paper paper=pService.getPaper(Integer.parseInt(paperId));
		model.put("paper", paper);
		Map<String,List<Question>> map=getQuestions(paper);
		model.put("questionMap", map);
		model.put("sqCount", map.get("sQuestions").size());
		model.put("mqCount", map.get("mQuestions").size());
		return "startExam";
	}
	
	//分别获取试卷中的单选题和多选题
	private Map<String,List<Question>> getQuestions(Paper paper){
		List<Question> sQuestions=new ArrayList<Question>();
		List<Question> mQuestions=new ArrayList<Question>();
		for(Question q:paper.getQuestions()){
			if("s".equals(q.getType()))
				sQuestions.add(q);
			if("m".equals(q.getType()))
				mQuestions.add(q);
		}
		Map<String,List<Question>> map=new HashMap<String, List<Question>>();
		map.put("sQuestions", sQuestions);
		map.put("mQuestions", mQuestions);
		for(Question q:sQuestions)
			System.out.println(q.getSubject());
		System.out.println("-----------------");
		for(Question q:mQuestions)
			System.out.println(q.getSubject());
		return map;
	}
	
	//考生提交试卷，计算分数，然后存入StuResult中。
	@RequestMapping("submitPaper")
	public String submitPaper(HttpServletRequest req){
		
		Student student=(Student) req.getSession().getAttribute("loginStudent");
		if(student==null)
			return "redirect:../index.do";
		
		String paperId=req.getSession().getAttribute("paperId").toString();
		if(paperId==null)
			return "redirect:../index.do";
		
		Paper paper=pService.getPaper(Integer.parseInt(paperId));
		StuResult result=getStuResult(req,paper);
		result.setStudent(student);
		srService.add(result);
		
		return "default";		
	}

	//将考试结果封装到StuResult中
	private StuResult getStuResult(HttpServletRequest req, Paper paper) {
		Map<String,List<Question>> map=getQuestions(paper);
		List<Question> sQuestions=map.get("sQuestions");
		List<Question> mQuestions=map.get("mQuestions");
		//单选题和多选题的数量
		int sqCount=sQuestions.size();
		int mqCount=mQuestions.size();
		//两种题作对的数量
		int sCorrect=0;
		int mCorrect=0;
		//两种题的总分
		int sResult=0;
		int mResult=0;
		//以下循环的索引
		int index=0;
		//单选题不为空
		if(sqCount>0){
			int score=(int)40/sqCount;
			for(int i=0;i<sqCount;i++){
				index=i+1;
				String answer=req.getParameter("sa"+index);
				if(sQuestions.get(i).getAnswer().equals(answer))
					sCorrect++;
			}
			sResult=score*sCorrect;
		}
		//如果多选题不为空
		if(mqCount>0){
			int score=(int)60/mqCount;
			for(int i=0;i<sqCount;i++){
				index=i+1;
				String[] answers=req.getParameterValues("ma"+index);
				if(answers==null)
					continue;
				String answer=AnswerUtil.parseMultipleAnswer(answers);
				if(mQuestions.get(i).getAnswer().equals(answer))
					mCorrect++;
			}
			mResult=score*mCorrect;
		}
		
		System.out.println("single:"+sResult);
		System.out.println("multiple:"+mResult);
		StuResult result=new StuResult();
		result.setPaper(paper);
		result.setResSingle(sResult);
		result.setResMore(mResult);
		result.setResTotal(sResult+mResult);
		result.setJoinTime(TimeUtil.getTime());
		return result;
	}
	
	@RequestMapping("queryResult")
	public String queryResult(HttpSession session,ModelMap model){
		Student student=(Student) session.getAttribute("loginStudent");
		if(student==null)
			return "redirect:../index.do";
		String stuId=student.getId();
		List<StuResult> stuResults=sService.getStudentById(stuId).getStuResults();
		System.out.println("stuResult:"+stuResults.size());
		model.put("stuResults", stuResults);
		return "queryResult";
	}
}
