<!-- Example XSLT -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:key name="RecipeKey" match="recipe" use="@id"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Testing Keys and Keyrefs</title>
      </head>
      <body>
        <!-- Example: Retrieve recipe details using key() function -->
        <xsl:apply-templates select="key('RecipeKey', 'recipe_id')"/>
      </body>
    </html>
  </xsl:template>
  
  <!-- Template to output recipe details -->
  <xsl:template match="recipe">
    <div>
      <h2><xsl:value-of select="title"/></h2>
      <p><xsl:value-of select="description"/></p>
    </div>
  </xsl:template>
</xsl:stylesheet>
