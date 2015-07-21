package com.ets.test;

import org.junit.Test;
import com.ets.util.*;
public class TestRoom {
	@Test
	public void getAnswer(){
		String a1="A,B,C,D";
		String[] a1s=a1.split(",");
		for(String s:a1s){
			System.out.println(s);
		}
	}
	
	@Test
	public void getTime(){
		System.out.println(TimeUtil.getTime());
	}
	
	@Test
	public void testInt(){
		int b=(int)40/3;
		System.out.println(b);
	}
	
	@Test
	public void testString(){
		String[] strs={"A","B","C","D"};
		String s=AnswerUtil.parseMultipleAnswer(strs);
		System.out.println(s);
	}
}
