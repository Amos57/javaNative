package com.amos.file.manager;

import java.io.IOException;

public class File implements AutoCloseable{

	private String path; 
	public File(String path) {
		this.setPath(path);
		
	}
	
	static{
		System.load("C:/Users/Amos57/workspace/FileNative/build_c/File.dll");
	}
	
	public File() {}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
	public void delete() throws IOException{
		delete0(path);
	}
	
	private native void delete0(String test); //throws IOException;
	
	private native void write0(String path,String text) throws IOException;


	public void write(String text) throws IOException{
		write0(path,text);
	}
	
	
	public void create(){
		creat0(path);
	}
	
	private native void creat0(String path);
	
	private native void close0();
	
	@Override
	public void close() throws Exception {
	close0();
		
	}
	
	
	
}
