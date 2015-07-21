package com.ets.util;

public class AnswerUtil {
	public static String parseMultipleAnswer(String[] strs){
		StringBuilder sb=new StringBuilder();
		for(int i=0;i<strs.length;i++){
			sb.append(strs[i]);
			sb.append(",");
		}
		sb.deleteCharAt(sb.length()-1);
		String s=sb.toString();
		return s;
	}
}
