package page.util;

public class PageUtil {
	private int pageNum; // 현재 페이지 번호
	private int startRow; // 시작행번호
	private int endRow; // 끝행번호
	private int totalPageCount; // 전체페이지갯수
	private int startPageNum; // 시작페이지번호
	private int endPageNum; // 끝페이지번호
	private int rowBlockCount; // 한페이지에 보여질 글의 갯수
	private int pageBlockCount; // 한페이지에 보여질 페이지의 갯수
	private int totalRowCount; // 전체 글의 갯수

	public PageUtil() {
	}   

	public PageUtil(int pageNum, int totalRowCount, int rowBlockCount, int pageBlockCount) {
		super();
		this.pageNum = pageNum;
		this.totalRowCount = totalRowCount;
		this.rowBlockCount = rowBlockCount;
		this.pageBlockCount = pageBlockCount;

		// 시작행번호
		startRow = (pageNum - 1) * rowBlockCount + 1;
		// 끝행번호
		endRow = startRow + rowBlockCount - 1;
		// 전체페이지갯수
		totalPageCount = (int) Math.ceil(totalRowCount / (double) rowBlockCount);
		// 시작페이지번호
		startPageNum = (pageNum - 1) / pageBlockCount * pageBlockCount + 1;
		// 끝페이지번호
		endPageNum = startPageNum + pageBlockCount - 1;
		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}

	}

	public int getPageNum() {
		return pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public int getRowBlockCount() {
		return rowBlockCount;
	}

	public int getPageBlockCount() {
		return pageBlockCount;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	@Override
	public String toString() {
		return "PageUtil [pageNum=" + pageNum + ", startRow=" + startRow + ", endRow=" + endRow + ", totalPageCount="
				+ totalPageCount + ", startPageNum=" + startPageNum + ", endPageNum=" + endPageNum + ", rowBlockCount="
				+ rowBlockCount + ", pageBlockCount=" + pageBlockCount + ", totalRowCount=" + totalRowCount + "]";
	}
	

}

