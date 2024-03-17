<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--This line below was necessary when using xsltransform.net-->
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <!--TEMPLATE 1
    We match to the root of the XML source file.-->
    <xsl:template match="/">
    <!--We insert html elements to render the output more visually appealing-->
        <html>
            <head>
                <title>Low Glycemic Recipes</title>
                <!--This defines the structure of the table
                We have a light-grey fine border around each cell
                We align the text to the elft
                We define padding i.e. space between the content and the border
                We set te header cells to a different color from the rest-->
                <style>
                    table {
                        border-collapse: collapse;
                        width: 100%;
                    }
                    th, td {
                        border: 1px solid #dddddd;
                        text-align: left;
                        padding: 8px;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <!--We count all recipes that have an idref sugar with a nutr_value of less than 5-->
            <body>
                <h2>Here is the list of <xsl:value-of select="count(//recipes/recipe[information/value_information/nutrition/nutr_value[@idref='sugar' and . &lt; 5]])"/> low-sugar recipes</h2>

                <table>
                    <tr>
                        <th>Recipe Title</th>
                        <th>Sugar Content (g)</th>
                    </tr>
                    <!--For each recipe that has an idref sugar with a nutr_value of less than 5, we sort them from lowest sugar content to higher
                    We retrieve the recipe name and the sugar level -->
                    <xsl:for-each select="//recipes/recipe[information/value_information/nutrition/nutr_value[@idref='sugar' and . &lt; 5]]">
                        <xsl:sort select="information/value_information/nutrition/nutr_value[@idref='sugar']" data-type="number" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="information/value_information/nutrition/nutr_value[@idref='sugar']"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>