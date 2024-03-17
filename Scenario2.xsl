<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title> Quick and Easy Recipes</title>
            </head>
            <body>
                <h2>Here is the list of <xsl:value-of select="count(//recipes/recipe[information/value_information/tag_values/tag_value[@idref='quickeasy'])"/> recipes</h2>

                <xsl:for-each select="//recipes/recipe[information/value_information/tag_values/tag_value[@idref='quickeasy']">
                    <xsl:sort select="//recipes/recipe[information/value_information/tag_values/tag_value[@idref='quickeasy']" data-type="number" order="ascending"/>
                    <p>
                        <b><xsl:value-of select="title"/></b>
                        <xsl:value-of select="information/value_information/tag_values/tag_value[@idref='quickeasy']"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>