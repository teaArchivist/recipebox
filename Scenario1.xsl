<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Low Glycemic Recipes</title>
            </head>
            <body>
                <h2>Here is the list of <xsl:value-of select="count(//recipes)"/>recipes</h2>

                <xsl:for-each select="recipes/recipe/value_information/nutrition/nutr_value[@idref='sugar' and . &lt; 5]">
                    <xsl:sort select="@nutr_value[@idref='sugar']" order="descending"/>
                    <p>
                        <b><td><xsl:value-of select="@nutr_value[@idref='sugar']"/></td>:
                        <td><xsl:value-of select="title"/></td></b>
                    </p>

                </xsl:for-each>

            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>