<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" />
  
  <xsl:variable name="doc" select="document('landing.xml')" />
  <xsl:variable name="title" select="$doc/landing/title[lang($language)]" />
  <xsl:variable name="subtitle" select="$doc/landing/subtitle[lang($language)]" />
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
	  
	  <section class="flex flex-col items-center gap-3">
	    <div class="w-32">
	      <img src="../favicon.png" />
	    </div>
	    <h3 class="text-4xl font-bold"><xsl:value-of select="$title" /></h3>
	    <span class="text-xl"><xsl:value-of select="$subtitle" /></span>
	  </section>
	  
	  <xsl:apply-templates select="$doc/landing/link" mode="list"/>
	  
	  <section class="flex flex-col gap-3">
	    <xsl:for-each select="$info/p">
	      <span class="text-xl">
		<xsl:for-each select="./node()">
		  <xsl:choose>
		    <xsl:when test="local-name() = 'a'">
		      <a href="{@href}"><span class="text-fifty-blue underline"><xsl:value-of select="." /></span></a>
		    </xsl:when>
		    <xsl:otherwise>
		      <xsl:value-of select="." />
		    </xsl:otherwise>
		  </xsl:choose>
		</xsl:for-each>
	      </span>
	    </xsl:for-each>
	  </section>
	  
	</main>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="link" mode="menu-strip">
    <a href="{@url}">
      <section class="info-card">
	<div class="text-5xl">
	  <xsl:value-of select="@icon" />
	</div>
	<div>
	  <h3 class="text-2xl font-bold"><xsl:value-of select="name[lang($language)]" /></h3>
	</div>
      </section>
    </a>
  </xsl:template>

  <xsl:template match="link" mode="list">
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
