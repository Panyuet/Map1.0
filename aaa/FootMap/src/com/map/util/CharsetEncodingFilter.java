 
  package com.map.util;

  import java.io.IOException;
  import javax.servlet.Filter;
  import javax.servlet.FilterChain;
  import javax.servlet.FilterConfig;
  import javax.servlet.ServletException;
  import javax.servlet.ServletRequest;
  import javax.servlet.ServletResponse;
  import javax.servlet.http.HttpServletRequest;
  import javax.servlet.http.HttpServletResponse;
  public class CharsetEncodingFilter implements Filter {

   private String encoding;
	
	public void destroy() {
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("encoding");
	}

  }
/*
<filter>
		<filter-name>CharsetEncodingFilter</filter-name>
		<filter-class>com.zte.util.CharsetEncodingFilter</filter-class>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>gbk</param-value>
		</init-param>
	</filter>
	
	<filter-mapping>
		<filter-name>CharsetEncodingFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
*/