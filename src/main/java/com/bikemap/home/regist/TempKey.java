package com.bikemap.home.regist;

import java.util.Random;

public class TempKey {

	public String qetKey() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48;
			if((num >=48 && num<=57) || (num>=65 && num <=90) || (num>=97 && num <=122)) {
				sb.append((char)num);
			} else {
				continue;
			}
		}while(sb.length() < 48);
		
		return sb.toString();
	}
}
