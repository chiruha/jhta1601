package fitness.dto;

public class EventDto {
	private int ev_num;
	private String ev_title;
	private int stf_num;
	private String ev_content;
	private String re_writer;
	private String re_content;
	private int re_ref;
	private int re_step;
	
	public EventDto() {}

	public EventDto(int ev_num, String ev_title, int stf_num, String ev_content, String re_writer, String re_content,
			int re_ref, int re_step) {
		super();
		this.ev_num = ev_num;
		this.ev_title = ev_title;
		this.stf_num = stf_num;
		this.ev_content = ev_content;
		this.re_writer = re_writer;
		this.re_content = re_content;
		this.re_ref = re_ref;
		this.re_step = re_step;
	}

	public int getEv_num() {
		return ev_num;
	}

	public void setEv_num(int ev_num) {
		this.ev_num = ev_num;
	}

	public String getEv_title() {
		return ev_title;
	}

	public void setEv_title(String ev_title) {
		this.ev_title = ev_title;
	}

	public int getStf_num() {
		return stf_num;
	}

	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}

	public String getEv_content() {
		return ev_content;
	}

	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}

	public String getRe_writer() {
		return re_writer;
	}

	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public int getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	@Override
	public String toString() {
		return "\n EventDto [ev_num=" + ev_num + ", ev_title=" + ev_title + ", stf_num=" + stf_num + ", ev_content="
				+ ev_content + ", re_writer=" + re_writer + ", re_content=" + re_content + ", re_ref=" + re_ref
				+ ", re_step=" + re_step + "]";
	}
	
	
}
