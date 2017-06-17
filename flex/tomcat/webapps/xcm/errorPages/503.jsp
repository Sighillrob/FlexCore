<html>
<head>
<%@ page import="com.xerox.docushare.avalon.elfbase.site.shadow.DefaultLocaleProvider"%>
<%@ page import="com.xerox.docushare.shadow.i18n.LocaleCollectionProvider"%>
<%@ page import="com.xerox.docushare.shadow.i18n.RequestLocaleParserImpl"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.google.inject.Provider"%>
<%@ page import="com.xerox.docushare.shadow.features.DebugJar"%>
<%@ page import="com.xerox.docushare.spyglass.i18n.LanguagePackLocaleURLMapProvider"%>
<%@ page import="com.xerox.docushare.common.i18n.LocaleFamilyExpanderFactory"%>
<%@ page import="com.xerox.docushare.common.i18n.LocaleFamilyExpander"%>
<%@ page import="com.xerox.docushare.shadow.i18n.LocalizedAssetFileImpl"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import="org.jdom.Document"%>
<%@ page import="org.jdom.JDOMException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="com.xerox.docushare.util.JDOMUtil;"%>

<%!
public class LocaleProvider implements Provider<Locale> {
  
  Locale l;
  public LocaleProvider( Locale locale) {
  l=locale;
  }
  public Locale get() {
    return l;
  }
}

public class DebugJarImpl implements DebugJar {
  public boolean isDebugJar() {
    return false;
  }
}

public class LocaleFamilyExpanderFactoryImpl implements LocaleFamilyExpanderFactory {
	public LocaleFamilyExpander create(Collection<Locale> localeCollection)
	{
		return new LocaleFamilyExpander(localeCollection);
	}
}

public Document compute(URL url){
	 Document document = null;
     InputStream is = null;
        try {
          URLConnection urlConnection = url.openConnection();
          is = urlConnection.getInputStream();
          document = JDOMUtil.jdomParse(JDOMUtil.newSAXBuilder(), is);
        } catch (JDOMException | IOException e) {
			System.err.println("MessageFileUtilImpl.Cache: URL=" + url+e);
        } finally {
          if (is != null) {
            try {
              is.close();
            } catch (IOException ioe) { /* ignore */
            }
          }
        }
        return document;
}
%>
<title></title>
</head>
<body>
<%
String errMsg;
try{
	DefaultLocaleProvider defaultLocaleProvider = new DefaultLocaleProvider();
	Locale defaultLocale = defaultLocaleProvider.get();

	LocaleCollectionProvider localeCollectionProvider = new LocaleCollectionProvider();  
	Collection<Locale> localeCollection=localeCollectionProvider.get();

	RequestLocaleParserImpl localeParser = new RequestLocaleParserImpl(localeCollection,defaultLocale);
	String acceptLanguage=request.getHeader("accept-language");
	Locale locale=localeParser.getLocale(acceptLanguage);

	LocaleProvider localeProvider = new LocaleProvider(localeParser.getLocale(acceptLanguage));
	LanguagePackLocaleURLMapProvider urlMapProvider = new LanguagePackLocaleURLMapProvider(new DebugJarImpl()); 
	LocaleFamilyExpanderFactoryImpl expanderFactory = new LocaleFamilyExpanderFactoryImpl();

	LocalizedAssetFileImpl assetFile= new LocalizedAssetFileImpl(urlMapProvider.get(),localeCollection,expanderFactory,localeProvider); 
	URL url=assetFile.getAssetFileURL("base/siteAccess","messages","messages.xml");
	Document msgDoc=compute(url);
	errMsg= JDOMUtil.selectElement(msgDoc,"/labels/updateInProgress").getText();
}
catch(Exception e)
{
	errMsg="A system update is in process.  Please try again later.";
}
%>
<p><%=errMsg%></p>
</body>
</html>

