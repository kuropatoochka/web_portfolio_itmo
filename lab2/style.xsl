<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1998/Math/MathML">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <math>
            <xsl:apply-templates/>
        </math>
    </xsl:template>

    <xsl:template match="строка">
        <mrow>
            <xsl:apply-templates/>
        </mrow>
    </xsl:template>

    <xsl:template match="число">
        <mn><xsl:value-of select="."/></mn>
    </xsl:template>

    <xsl:template match="операнд">
        <mi><xsl:value-of select="."/></mi>
    </xsl:template>

    <xsl:template match="оператор">
        <mo><xsl:value-of select="."/></mo>
    </xsl:template>

    <xsl:template match="дробь">
        <mfrac>
            <xsl:apply-templates select="строка"/>
        </mfrac>
    </xsl:template>

    <xsl:template match="корень">
        <msqrt>
            <xsl:apply-templates/>
        </msqrt>
    </xsl:template>

    <xsl:template match="верх">
        <msup>
            <xsl:apply-templates select="строка"/>
        </msup>
    </xsl:template>

    <xsl:template match="низ">
        <msub>
            <xsl:apply-templates select="строка"/>
        </msub>
    </xsl:template>

    <xsl:template match="низверх">
        <munderover>
            <xsl:apply-templates select="строка"/>
        </munderover>
    </xsl:template>

</xsl:stylesheet>