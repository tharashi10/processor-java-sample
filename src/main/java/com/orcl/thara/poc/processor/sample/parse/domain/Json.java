package com.orcl.thara.poc.processor.sample.parse.domain;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Json {
	private List<Data> data;

	@NoArgsConstructor
	@AllArgsConstructor
	@Getter
	@Setter
	public static class Data{
		private LocalDateTime time;
		private HashMap<String,Object> value;
	}
}