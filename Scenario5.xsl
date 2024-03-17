<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
		<head><title>Most Popular Recipes</title></head>
		<body>
		<h1>Here is the list of <xsl:value-of select="count(//recipes/recipe/comments)" /> recipes</h1>
		<xsl:for-each select="//recipes/recipe/comments">
            <xsl:value-of select="@idref">
					<xsl:apply-templates select="user_feedback"/>
			</xsl:value-of>
		</xsl:for-each>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="user_feedback">
		<xsl:attribute name="comment">
			<xsl:value-of select="//user_feedback/comment/@id" />
			<xsl:if test="//user_feedback/comment/@id == //recipes/recipe/comments/@idref">
				<recipe><xsl:value-of select="//recipes/recipe/title"/></recipe>
				<xsl:apply-templates select="rating"/>
			</xsl:if>
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="rating">
		<xsl:value-of select="rating"/>
	</xsl:template>
			
</xsl:stylesheet>