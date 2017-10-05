package com.fs.dev;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.util.HashMap;

public class LogContent implements java.io.Serializable {
	private HashMap<Integer, Long> fileContents = new HashMap<Integer, Long>();
	private int pageNumber = 0;
	private long lineNumber = 0;
	private String encoding = null;
	private int linePerPage = 50;
	private String fileName = null;
	public LogContent(String filename) {
		this(filename,42);
	}
	public LogContent(String filename,int linesPerPage) {
		this.fileName = filename;
		this.linePerPage = linesPerPage;
		long seek = 0;		
		try {			
			RandomAccessFile file= new RandomAccessFile(filename, "r");			
			FileInputStream fis = new FileInputStream(filename);
			InputStreamReader xx = new InputStreamReader(fis);			
			encoding = xx.getEncoding();
			xx.close();
			fis.close();	
			int lineCounter = 0;
			long length = file.length();
			while(seek < length) {				
				file.readLine();
			    seek = file.getFilePointer();
			    lineNumber++;		
				lineCounter++;
			    if((lineCounter%linePerPage)==0)
				{
					fileContents.put(pageNumber, seek);
					pageNumber++;
					lineCounter = 0;
				}
			}
			file.close();
			if(lineCounter>0) {
				fileContents.put(pageNumber, seek);
				pageNumber++;				
			}
		} catch(Exception ex){
			ex.printStackTrace();
		}
	}	
	public int getAllPageNumber() {
		return fileContents.size();
	}
	public String getEncoding() {
		return encoding;
	}	
	public String getFileName() {
		return fileName;
	}	
	public int getLinePerPage() {
		return linePerPage;
	}
	public long getMaxLineNumber() {
		return lineNumber;
	}
	public long getPageLastPosition(int page) throws NullPointerException {
		return (long)fileContents.get(page-1);
	}
}