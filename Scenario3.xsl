<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

<!--This scenario is outputing recipes that are Summer Recipes.
The template is matching and counting recipes that have a tag_value 'summer'.
It selectes the recipes with the tag_value of 'summer' and selects/outputs the recipe title. -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Summer Recipes</title>
            </head>
            <body>
                <h2>Here is the list of <xsl:value-of select="count(//recipe[information/value_information/tag_values/tag_value[@idref='summer']])"/>Summer recipes:</h2>

                <xsl:for-each select="//recipe[information/value_information/tag_values/tag_value[@idref='summer']]">
                    <p>
                        <b><xsl:value-of select="title"/></b>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>