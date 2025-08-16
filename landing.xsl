<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" />
  
  <xsl:variable name="doc" select="document('landing.xml')" />
  <xsl:variable name="title" select="$doc/landing/title[lang($language)]" />
  <xsl:variable name="info" select="$doc/landing/info[lang($language)]" />
  
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="$title" /></title>
	<link rel="stylesheet" href="../dist/style.css" />
	<link rel="icon" href="../favicon.png" />
      </head>

      <body class="min-h-screen bg-gray-100">
	<main class="min-h-screen flex flex-col justify-center gap-8 max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
	  <section class="flex items-center gap-3 h-35 px-4 py-5 sm:p-6 bg-white overflow-hidden shadow rounded-lg">
	    <div class="w-18">
	      <img src="../favicon.png" />
	    </div>
	    <div>
	      <h3 class="text-2xl font-bold text-gray-900"><xsl:value-of select="$title" /></h3>
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
      <section class="flex items-center gap-3 h-35 px-4 py-5 sm:p-6 bg-white overflow-hidden shadow rounded-lg">
	<div class="text-5xl">
	  <xsl:value-of select="@icon" />
	</div>
	<div>
	  <h3 class="text-2xl font-bold text-gray-900"><xsl:value-of select="name[lang($language)]" /></h3>
	  <span class="text-xl"><xsl:value-of select="info[lang($language)]" /></span>
	</div>
      </section>
    </a>
  </xsl:template>
  
</xsl:stylesheet>
