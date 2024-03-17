<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <!--Define Key for recipes in recipe box-->
<xsl:key name="RecipeKey" match="recipe" use="@id"/>

<xsl:template match="/">
<html>
  <head>
    <title>Testing Keys and Keyrefs</title>
  </head>
  <body>
    <xsl:apply-templates select="key('RecipeKey', @idref)"/>
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
