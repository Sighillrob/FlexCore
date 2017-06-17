<xsl:stylesheet version='1.0' 
                xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
                xmlns:common="http://exslt.org/common"
                xmlns:cr="http://www.xerox.com/2006/dsbu/docushare/contentRule"
                xmlns:ds="http://www.xerox.com/2006/dsbu/docushare"
                extension-element-prefixes="common">
  <xsl:output method='xml' version='1.0' encoding='UTF-8' indent='yes'/>
  
  <xsl:variable name="eventdoc" select="document('event.xml')" />
  <xsl:variable name="targeted_object" select="$eventdoc/EventDoc/event/targeted_objects/*[1]" />
  <xsl:variable name="username" select="$eventdoc/EventDoc/event/emitter/props/username" /> 
  <xsl:variable name="firstname" select="$eventdoc/EventDoc/event/emitter/props/first_name" />
  <xsl:variable name="lastname" select="$eventdoc/EventDoc/event/emitter/props/last_name" />
  <xsl:variable name="email" select="$eventdoc/EventDoc/event/emitter/props/email" />
  <xsl:variable name="owneremail" select="$eventdoc/EventDoc/Subscription/owner/props/email" />
  <xsl:variable name="owner" select="$eventdoc/EventDoc/Subscription/owner/handle" />
  <xsl:variable name="container" select="$eventdoc/EventDoc/event/parents/*[1]/props/title" />
  <xsl:variable name="containerurl" select="$eventdoc/EventDoc/event/parents/*[1]/url" />
  <xsl:variable name="document" select="$eventdoc/EventDoc/event/targeted_objects/*[@baseclassname='Document']" />

  <xsl:template match="/" name="root">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="node()">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="/workflow/task">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
      <xsl:choose>
        <xsl:when test="$document">
          <xsl:call-template name="doit">
            <xsl:with-param name="target" select="$document" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="doit">
            <xsl:with-param name="target" select="targeted_object" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <xsl:template name="doit" >
    <xsl:param name="target" />
    <xsl:variable name="description" select="$target/props/description" />
    <xsl:variable name="title" select="$target/props/title" />
    <xsl:variable name="summary" select="$target/props/summary" />
    <xsl:variable name="url" select="$target/url" />
    <xsl:variable name="handle" select="$target/handle" />

    <!-- all task elements are inserted here -->

  </xsl:template>
</xsl:stylesheet>
