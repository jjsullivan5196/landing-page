<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" />
  
  <xsl:variable name="doc" select="document('landing.xml')" />
  <xsl:variable name="title" select="$doc/landing/title[lang($language)]" />
  <xsl:variable name="info" select="$doc/landing/info[lang($language)]" />
  
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="$title" /></title>
	<link rel="icon" href="../favicon.png" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true" />
	<link rel="stylesheet" href="../dist/style.css" />
      </head>

      <body class="min-h-screen bg-fifty-lightgray font-work-sans">
	<main class="main-content">
	  <section class="flex items-end gap-3">
	    <a href="../en/" class="lang-btn"><span>English</span></a>
	    <a href="../es/" class="lang-btn"><span>Español</span></a>
	  </section>
	  <section class="info-card">
	    <div class="w-18">
	      <img src="../favicon.png" />
	    </div>
	    <div>
	      <h3 class="text-2xl font-bold"><xsl:value-of select="$title" /></h3>
	      <span class="text-xl"><xsl:value-of select="$info" /></span>
	    </div>
	  </section>
	  <xsl:apply-templates select="$doc/landing/link" />
	</main>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="link">
    <a href="{@url}">
      <section class="info-card">
	<div class="text-5xl">
	  <xsl:value-of select="@icon" />
	</div>
	<div>
	  <h3 class="text-2xl font-bold"><xsl:value-of select="name[lang($language)]" /></h3>
	  <span class="text-xl"><xsl:value-of select="info[lang($language)]" /></span>
	</div>
      </section>
    </a>
  </xsl:template>
  
</xsl:stylesheet>
