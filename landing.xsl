<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" />
  
  <xsl:variable name="doc" select="document('landing.xml')" />
  <xsl:variable name="title" select="$doc/landing/title[lang($language)]" />
  <xsl:variable name="info" select="$doc/landing/info[lang($language)]" />
  
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="$title" /></title>
	<link rel="stylesheet" href="../style.css" />
	<link rel="icon" href="../favicon.png" />
      </head>

      <body>
	<section>
	  <div class="logo">
	    <img src="../favicon.png" />
	  </div>
	  <div>
	    <h2><xsl:value-of select="$title" /></h2>
	    <span><xsl:value-of select="$info" /></span>
	  </div>
	</section>
	<xsl:apply-templates select="$doc/landing/link" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="link">
    <a href="{@url}">
      <section>
	<div class="icon">
	  <span><xsl:value-of select="@icon" /></span>
	</div>
	<div>
	  <h2><xsl:value-of select="name[lang($language)]" /></h2>
	  <span><xsl:value-of select="info[lang($language)]" /></span>
	</div>
      </section>
    </a>
  </xsl:template>
  
</xsl:stylesheet>
