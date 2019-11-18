package domain;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import jdk.jfr.Registered;

public class Record {
	
	@NotEmpty @Length(max=50, message="제목은 50글자 이내로 작성하세요")
	private String title;
	@NotEmpty @Length(max=90, message="요약글은 90글자 이내로 작성하세요")
	private String summary;
	@Range(min=1, max=2, message="잘못된 접근입니다")
	private int type;
	private String content, write_time, writer;
	private int id;
	@Pattern(regexp="[a-zA-Z]{1,60}|[가-힣]{1,20}", message="한글이나 영어로 가능한 한 간결하게 적어주세요")
	String emotion;
	
	public String getEmotion() {
		return emotion;
	}

	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSummary() {
		return summary;
	}
	
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrite_time() {
		return write_time;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
