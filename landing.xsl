<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:variable name="doc" select="document('landing.xml')" />
  
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="$doc/landing/title[lang($language)]" /></title>
      </head>

      <body>
	<article>
	  <ul>
	    <xsl:apply-templates select="$doc/landing/link" />
	  </ul>
	</article>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="link">
    <li>
      <a href="{@url}">
	<span><xsl:value-of select="name[lang($language)]" /></span>
      </a>
      <ul>
	<li>
	  <span><xsl:value-of select="info[lang($language)]" /></span>
	</li>
      </ul>
    </li>
  </xsl:template>
  
</xsl:stylesheet>
