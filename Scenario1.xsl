<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Low Glycemic Recipes</title>
            </head>
            <body>
                <h2>Here is the list of <xsl:value-of select="count(//recipes/recipe[information/value_information/nutrition/nutr_value[@idref='sugar' and . &lt; 5]])"/> recipes</h2>

                <xsl:for-each select="//recipes/recipe[information/value_information/nutrition/nutr_value[@idref='sugar' and . &lt; 5]]">
                    <xsl:sort select="information/value_information/nutrition/nutr_value[@idref='sugar']" data-type="number" order="ascending"/>
                    <p>
                        <b><xsl:value-of select="title"/></b>
                        <xsl:value-of select="information/value_information/nutrition/nutr_value[@idref='sugar']"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>