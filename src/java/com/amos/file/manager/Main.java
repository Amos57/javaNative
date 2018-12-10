package com.amos.file.manager;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

public class Main {

	public static void main(String[] args) throws Exception {
	
		try(File f= new File("C:\\Users\\Amos57\\Desktop\\ttTest.txt")){
			f.create();
			f.write("a");
			
			
		}catch (IOException e) {
			
			e.printStackTrace();
		}
		}
	
}
