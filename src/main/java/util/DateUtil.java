package util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class DateUtil {

	public SimpleDateFormat myFormat = new SimpleDateFormat("yyMMddkkmmss");
	
	public String getCurrentTime() {
		return myFormat.format(new Date());
	}
	
	public String formatDate(Date date) {
		return myFormat.format(date);
	}
}
