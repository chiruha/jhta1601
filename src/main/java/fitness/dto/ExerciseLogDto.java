package fitness.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;



public class ExerciseLogDto {
	private int exlog_num;
    private String exlog_title; 
    private String exlog_writer;     
    private String exlog_content;
    private String exlog_member;
    private Date exlog_date;
    
    public ExerciseLogDto() {}

	public ExerciseLogDto(int exlog_num, String exlog_title, String exlog_writer, String exlog_content,
			String exlog_member, Date exlog_date) {
		super();
		this.exlog_num = exlog_num;
		this.exlog_title = exlog_title;
		this.exlog_writer = exlog_writer;
		this.exlog_content = exlog_content;
		this.exlog_member = exlog_member;
		this.exlog_date = exlog_date;
	}

	public int getExlog_num() {
		return exlog_num;
	}

	public void setExlog_num(int exlog_num) {
		this.exlog_num = exlog_num;
	}

	public String getExlog_title() {
		return exlog_title;
	}

	public void setExlog_title(String exlog_title) {
		this.exlog_title = exlog_title;
	}

	public String getExlog_writer() {
		return exlog_writer;
	}

	public void setExlog_writer(String exlog_writer) {
		this.exlog_writer = exlog_writer;
	}

	public String getExlog_content() {
		return exlog_content;
	}

	public void setExlog_content(String exlog_content) {
		this.exlog_content = exlog_content;
	}

	public String getExlog_member() {
		return exlog_member;
	}

	public void setExlog_member(String exlog_member) {
		this.exlog_member = exlog_member;
	}

	public Date getExlog_date() {
		return exlog_date;
	}

	public void setExlog_date(Date exlog_date) {
		this.exlog_date = exlog_date;
	}

	@Override
	public String toString() {
		return "ExerciseLogDto [exlog_num=" + exlog_num + ", exlog_title=" + exlog_title + ", exlog_writer="
				+ exlog_writer + ", exlog_content=" + exlog_content + ", exlog_member=" + exlog_member + ", exlog_date="
				+ exlog_date + "]";
	}
    
	
   
   
	
    
    
    
}



















