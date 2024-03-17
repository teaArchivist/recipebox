<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Most Popular Recipes</title>
            </head>
            <body>
                <h2>Here is the list of <xsl:value-of select="count(//recipes/recipe)"/> recipes</h2>

				  <xsl:template match="/">
					<xsl:element name="user_feedback">
					  <xsl:apply-templates select="//user_feedback">
							<xsl:sort select="rating" order="ascending" />
					  </xsl:apply-templates>
					</xsl:element>  
				  </xsl:template>s
				  
				  <xsl:template match="user_feedback">
					<xsl:copy>
						<xsl:attribute name="comment">
							<xsl:value-of select="//recipes/recipe/comments/comment/@idref" />
						</xsl:attribute>
						<xsl:apply-templates select="rating"/>
					</xsl:copy>
				  </xsl:template>
					
				  <xsl:template match="rating">
					<xsl:copy>
					<xsl:apply-templates/>
					</xsl:copy>
				  </xsl:template>
								
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>