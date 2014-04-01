<?xml version="1.0" encoding="ISO8859-15"?>

<!--  $Id: book.xsl 71 2010-11-11 15:38:01Z acorugedo $ -->

<!-- Fichero modificado que incorpora todos los cambios sobre los ficheros estandar distribuidos
	  en esta capa de abstraccion. AFCF -->

<!-- http://docbook.sourceforge.net/release/xsl/current/doc/fo/ -->


<!-- Entidades definidas exclusivamente para el documento actual
     Existe otro fichero de entidades comun para todos los documentos
     en 999_COMUN -->

<!DOCTYPE xsl:stylesheet [
  <!ENTITY % ents	SYSTEM "entities_documento.xml">
  %ents;
]>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

<!-- The local path to Norm Walsh's DocBook FO stylesheets -->
<!-- CAMBIAR ESTO PARA REFLEJAR SU LOCALIZACION EN NUESTRO EQUIPO AFCF
 Ubuntu: file:////usr/local/share/xsl/docbook/fo/docbook.xsl
 RedHat: file:///usr/share/sgml/docbook/xsl-stylesheets/fo/
 -->
<xsl:import href="file:///usr/share/sgml/docbook/xsl-stylesheets/fo/docbook.xsl"/>


<!--  Ruta de las imágenes como marcas de agua de los documentos y activacion/desactivacion -->
<xsl:param name="draft.mode" select="'no'"></xsl:param>
<xsl:param name="draft.watermark.image" select="'file:///svn/SGSI/99_COMUN/marcasagua/borrador.png'"></xsl:param>

<!-- Ruta de las viñetas "callouts" usadas en los documentos -->
<xsl:param name="callout.graphics.path">callouts/</xsl:param>


<xsl:param name="use.svg" select="1"></xsl:param>

<!-- Tamaño de página para los documentos (A4) y márgenes -->
<xsl:param name="paper.type">A4</xsl:param>

<!-- Orientacion de página para los documentos (A4)  -->
<xsl:param name="page.orientation">portrait</xsl:param>

<!-- Margenes -->
<xsl:param name="body.margin.top">2cm</xsl:param>
<xsl:param name="body.margin.bottom">2cm</xsl:param>

<!-- sangría del texto con respecto a la sección -->
<xsl:param name="body.start.indent">25pt</xsl:param>

<!-- Tamaños de encabezado y pie de página -->
<xsl:param name="region.before.extent">1cm</xsl:param>
<xsl:param name="region.after.extent">2cm</xsl:param>

<!-- Lineas de separación de encabezado y pie de página -->
<xsl:param name="header.rule">1</xsl:param>
<xsl:param name="footer.rule">1</xsl:param>

<!-- Generación automática de tablas de ficguras, tablas, contenido, etc -->
<xsl:param name="generate.toc" select="1"/>
<xsl:param name="generate.book.figure.lot" select="1"/>
<xsl:param name="generate.book.table.lot" select="1"/>
<xsl:param name="generate.index" select="0"/>

<!-- DOBLE CARA -->
<xsl:param name="double.sided">0</xsl:param>

<xsl:param name="column.count.titlepage" select="1"/>
<xsl:param name="column.count.lot" select="1"/>
<xsl:param name="column.count.front" select="1"/>
<xsl:param name="column.count.body" select="1"/>
<xsl:param name="column.count.back" select="1"/>
<xsl:param name="column.count.index" select="2"/>

<xsl:param name="chapter.autolabel" select="1"/>  
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="title.margin.left" select="'0pt'"/>
<xsl:param name="section.label.includes.component.label" select="1"/>

<xsl:param name="hyphenate">false</xsl:param>

<!-- COVER Introduce cubierta frontal para el documento 

<xsl:template name="front.cover">
  <xsl:call-template name="page.sequence">
    <xsl:with-param name="master-reference">titlepage</xsl:with-param>
    <xsl:with-param name="content">
      <fo:block text-align="center">
        <fo:external-graphic src="url(img/cover.jpg)" />
      </fo:block>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template> -->


<!-- COVER Introduce cubierta trasera para el documento 

<xsl:template name="back.cover">
  <xsl:call-template name="page.sequence">
    <xsl:with-param name="master-reference">titlepage</xsl:with-param>
    <xsl:with-param name="content">
      <fo:block text-align="center">
        <fo:external-graphic src="url(img/cover.jpg)" />
      </fo:block>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template> -->

<!-- TITLEPAGE Tamaño del titulo del documento 

<xsl:attribute-set name="book.titlepage.recto.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">28pt</xsl:attribute>
  <xsl:attribute name="text-align">right</xsl:attribute>
  <xsl:attribute name="color">blue</xsl:attribute>
</xsl:attribute-set> -->

<!-- Tamaño de letra por defecto del texto -->
<xsl:param name="body.font.master">9</xsl:param>
<xsl:param name="body.font.size">
	<xsl:value-of select="$body.font.master"/><xsl:text>pt</xsl:text>
</xsl:param>

<!-- BOOK Tamaños de letras en portada y contraportada -->

<xsl:template match="title" mode="book.titlepage.recto.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.recto.style" text-align="right" font-size="18pt" space-before="18.0pt" font-weight="bold" font-family="{$title.fontset}" border-top="1.5pt solid black">
<xsl:call-template name="division.title">
<xsl:with-param name="node" select="ancestor-or-self::book[1]"/>
</xsl:call-template>
</fo:block>
</xsl:template>

<xsl:template match="subtitle" mode="book.titlepage.recto.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.recto.style" text-align="right" font-size="12.0pt" space-before="6.0pt" font-family="{$title.fontset}">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="corpauthor" mode="book.titlepage.recto.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.recto.style" text-align="right" font-size="10pt" keep-with-next.within-column="always" space-before="0.5in">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="authorgroup" mode="book.titlepage.recto.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.recto.style" text-align="right" space-before="2in">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="author" mode="book.titlepage.recto.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.recto.style" text-align="right" font-size="10.0pt" space-before="10.8pt" keep-with-next.within-column="always">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="author" mode="book.titlepage.recto.mode">
  <fo:external-graphic>
  <xsl:attribute name="src">imgasp/logo_asp_portada.png</xsl:attribute>
  </fo:external-graphic>
  <!--
  <fo:inline color="blue">
  -->
    <xsl:apply-templates mode="titlepage.mode"/>
  <!--
  </fo:inline>
  -->
</xsl:template>

<xsl:template match="title" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style" font-size="10pt" font-weight="bold" font-family="{$title.fontset}">
<xsl:call-template name="book.verso.title">
</xsl:call-template>
</fo:block>
</xsl:template>

<xsl:template match="corpauthor" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="authorgroup" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style">
<xsl:call-template name="verso.authorgroup">
</xsl:call-template>
</fo:block>
</xsl:template>

<xsl:template match="author" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="othercredit" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="releaseinfo" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style" space-before="0.5em">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="pubdate" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style" space-before="1em">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="copyright" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="abstract" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>

<xsl:template match="legalnotice" mode="book.titlepage.verso.auto.mode">
<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="book.titlepage.verso.style" font-size="8pt">
<xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
</fo:block>
</xsl:template>


<!-- SECTION Tamaños de letras en títulos de capitulo y apendice -->
<!-- CHAPTER -->

<xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">  
  <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" 
            xsl:use-attribute-sets="chapter.titlepage.recto.style" 
            margin-left="{$title.margin.left}" 
            font-size="15pt" 
            font-weight="bold" 
            font-family="{$title.font.family}">
    <xsl:call-template name="component.title">
      <xsl:with-param name="node" select="ancestor-or-self::chapter[1]"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<xsl:template match="title" mode="chapter.titlepage.verso.auto.mode">  
  <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" 
            xsl:use-attribute-sets="chapter.titlepage.verso.style" 
            margin-left="{$title.margin.left}" 
            font-size="15pt" 
            font-weight="bold" 
            font-family="{$title.font.family}">
    <xsl:call-template name="component.title">
      <xsl:with-param name="node" select="ancestor-or-self::chapter[1]"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- APPENDIX -->
<xsl:template match="title" mode="appendix.titlepage.recto.auto.mode">  
  <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" 
            xsl:use-attribute-sets="appendix.titlepage.recto.style" 
            margin-left="{$title.margin.left}" 
            font-size="15pt" 
            font-weight="bold" 
            font-family="{$title.font.family}">
    <xsl:call-template name="component.title">
      <xsl:with-param name="node" select="ancestor-or-self::appendix[1]"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<xsl:template match="title" mode="appendix.titlepage.verso.auto.mode">  
  <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" 
            xsl:use-attribute-sets="appendix.titlepage.verso.style" 
            margin-left="{$title.margin.left}" 
            font-size="15pt" 
            font-weight="bold" 
            font-family="{$title.font.family}">
    <xsl:call-template name="component.title">
      <xsl:with-param name="node" select="ancestor-or-self::appendix[1]"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- PREFACE -->

<xsl:template name="preface.titlepage.recto">
  <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="preface.titlepage.recto.style" margin-left="{$title.margin.left}" font-size="15pt" font-family="{$title.fontset}" font-weight="bold">
<xsl:call-template name="component.title">
<xsl:with-param name="node" select="ancestor-or-self::preface[1]"/>
</xsl:call-template></fo:block>
</xsl:template>


<!-- SECTION Tamaños de letras en títulos de sección -->
<!-- Solamente los tres primeros niveles modifican su tamaño. El resto mantiene
el tamaño de la fuente básica aunque en negrita -->

<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.3"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level2.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.2"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level3.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.1"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level4.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.0"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<!-- página de créditos. Comentar para que aparezca
<xsl:template name="book.titlepage.verso"/>
<xsl:template name="book.titlepage.before.verso"/>
-->

<!-- página en blanco después del título. Comentar para que aparezca -->
<!-- <xsl:template name="book.titlepage.separator"/> -->

<!-- Forzado de SALTO DE PAGINA -->
<xsl:template match="processing-instruction('custom-pagebreak')">
<fo:block break-before='page'/>
</xsl:template>


<!-- Forzado de SALTO DE LINEA -->
<xsl:template match="processing-instruction('linebreak')">
  <fo:block/>
</xsl:template>

<!-- Forzado de ESPACIADO EN BLANCO 2 cm -->
<xsl:template match="processing-instruction('espaciado_2cm')">
  <fo:block margin-top="2cm"/>
</xsl:template>

<!-- Remover la palabra Capitulo del Titulo -->
<xsl:param name="local.l10n.xml" select="document('')"/>
 <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="es">
      <l:context name="title-numbered">
        <l:template name="chapter" text="%n. %t"/>
        <!-- other customizations here -->
      </l:context>
  </l:l10n>
</l:i18n>


<!-- Modificación de apariencia de teclas de teclado -->

<xsl:template match="keycap|keysim|keycombo">
  <xsl:call-template name="inline.teclado"/>
</xsl:template>

<xsl:template name="inline.teclado">
  <xsl:param name="content">
    <xsl:apply-templates/>
  </xsl:param>
	<fo:inline font-size="7.5pt" border="0.45pt solid black"
            padding-top="2pt" padding-bottom="0.75pt"
            padding-left="2pt" padding-right="2pt">  
  <fo:inline color="blue">
      <xsl:copy-of select="$content"/>
    </fo:inline>
  </fo:inline>
</xsl:template>

<!-- VERBATIM: programlisting, screen... -->
<xsl:attribute-set name="monospace.verbatim.properties">
  <xsl:attribute name="font-size">8pt</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="shade.verbatim" select="1"/>

<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
  <xsl:attribute name="padding">3pt</xsl:attribute>
</xsl:attribute-set>

<!-- título de las figuras... etc -->
<xsl:attribute-set name="formal.title.properties">
    <xsl:attribute name="font-size">6pt</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-family">Helvetica</xsl:attribute>
</xsl:attribute-set>


<!-- Anotaciones inline -->
<xsl:template match="lineannotation">
  <fo:inline font-family="{$body.font.family}"
             font-style="italic">
    <xsl:call-template name="inline.charseq"/>
  </fo:inline>
</xsl:template>


<!-- ENCABEZADOS 
Logos propios en imgasp
Logos clientes en imgcli
-->
<xsl:param name="header.column.widths">45 10 45</xsl:param>
	
<xsl:template name="header.content">  
    <xsl:param name="pageclass" select="''"/>
    <xsl:param name="sequence" select="''"/>
    <xsl:param name="position" select="''"/>
    <xsl:param name="gentext-key" select="''"/>
    <xsl:variable name="candidate">  
      <!-- sequence can be odd, even, first, blank -->
      <!-- position can be left, center, right -->
      <xsl:choose>
        <xsl:when test="$sequence = 'odd' and $position = 'left'">  
			<fo:external-graphic src="imgasp/logo_asp_header.png"/>
			<fo:block>
				<xsl:text>&header_left1;</xsl:text>
			</fo:block>
			<fo:block>
				<xsl:text>&header_left2;</xsl:text>
			</fo:block>
        </xsl:when>
        <xsl:when test="$sequence = 'odd' and $position = 'center'">
        </xsl:when>
        <xsl:when test="$sequence = 'odd' and $position = 'right'">
        <!-- Quitar el siguiente comentario para tener dos logos en el encabezado, -->
        <!-- Por ejemplo el del cliente (Alvaro Corugedo) -->
        <!-- <fo:external-graphic src="imgcli/logoqcorp.jpg"/> -->
         <!-- Inserta el titulo del capitulo actual 
        <xsl:apply-templates select="." mode="title.markup"/>
			<fo:block>
				<xsl:text>&header_right1;</xsl:text>
			</fo:block>
			<fo:block>
				<xsl:text>&header_right2;</xsl:text>
			</fo:block> -->
			<fo:external-graphic src="imgasp/logo_sgsi_header.png"/>
        </xsl:when>
        <xsl:when test="$sequence = 'even' and $position = 'left'">  
			<fo:external-graphic src="imgasp/logo_asp_header.png"/>
			<fo:block>
				<xsl:text>&header_left1;</xsl:text>
			</fo:block>
			<fo:block>
				<xsl:text>&header_left2;</xsl:text>
			</fo:block>
        </xsl:when>
        <xsl:when test="$sequence = 'even' and $position = 'center'">
        </xsl:when>
        <xsl:when test="$sequence = 'even' and $position = 'right'">
        <!-- Quitar el siguiente comentario para tener dos logos en el encabezado, -->
        <!-- Por ejemplo el del cliente (Alvaro Corugedo) -->
        <!-- <fo:external-graphic src="imgcli/logoqcorp.jpg"/> -->
         <!-- Inserta el titulo del capitulo actual 
        <xsl:apply-templates select="." mode="title.markup"/>
			<fo:block>
				<xsl:text>&header_right1;</xsl:text>
			</fo:block>
			<fo:block>
				<xsl:text>&header_right2;</xsl:text>
			</fo:block> -->
			<fo:external-graphic src="imgasp/logo_sgsi_header.png"/>
        </xsl:when>
        <xsl:when test="$sequence = 'first' and $position = 'left'"> 
			<fo:external-graphic src="imgasp/logo_asp_header.png"/>
			<fo:block>
				<xsl:text>&header_left1;</xsl:text>
			</fo:block>
			<fo:block>
				<xsl:text>&header_left2;</xsl:text>
			</fo:block>
        </xsl:when>
        <xsl:when test="$sequence = 'first' and $position = 'right'"> 
        <!-- Quitar el siguiente comentario para tener dos logos en el encabezado, -->
        <!-- Por ejemplo el del cliente (Alvaro Corugedo) -->
        <!-- <fo:external-graphic src="imgcli/logoqcorp.jpg"/> --> 
          <!-- Inserta el titulo del capitulo actual 
        <xsl:apply-templates select="." mode="title.markup"/>
			<fo:block>
				<xsl:text>&header_right1;</xsl:text>
			</fo:block>
			<fo:block>
				<xsl:text>&header_right2;</xsl:text>
			</fo:block> -->
			<fo:external-graphic src="imgasp/logo_sgsi_header.png"/>
        </xsl:when>
        <xsl:when test="$sequence = 'first' and $position = 'center'"> 
        </xsl:when>
        <xsl:when test="$sequence = 'blank' and $position = 'left'">
        </xsl:when>
        <xsl:when test="$sequence = 'blank' and $position = 'center'">
        </xsl:when>
        <xsl:when test="$sequence = 'blank' and $position = 'right'">
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

      <!-- Does runtime parameter turn off blank page headers? -->
      <xsl:choose>
        <xsl:when test="$sequence='blank' and $headers.on.blank.pages=1"> 
          <!-- no output AFCFC-->
        </xsl:when>

      <!-- titlepages have no headers -->
        <xsl:when test="$pageclass = 'titlepage'">
          <!-- no output -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:copy-of select="$candidate"/>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

  <!-- Header fonts and font size. -->
  <xsl:attribute-set name="header.content.properties">
	<!--<xsl:attribute name="font-family">Helvetica</xsl:attribute>-->
    <xsl:attribute name="font-size">8pt</xsl:attribute>
  </xsl:attribute-set>


  <xsl:template name="footer.content">  
    <xsl:param name="pageclass" select="''"/>
    <xsl:param name="sequence" select="''"/>
    <xsl:param name="position" select="''"/>
    <xsl:param name="gentext-key" select="''"/>
    <xsl:variable name="candidate">  
      <!-- sequence can be odd, even, first, blank -->
      <!-- position can be left, center, right -->
      <xsl:choose>
        <xsl:when test="$sequence = 'odd' and $position = 'left'">  
        		<xsl:text>&documento;</xsl:text>
        </xsl:when>
        <xsl:when test="$sequence = 'odd' and $position = 'center'">
			<fo:page-number/>
        </xsl:when>
        <xsl:when test="$sequence = 'odd' and $position = 'right'">
        </xsl:when>
        <xsl:when test="$sequence = 'even' and $position = 'left'">  
        </xsl:when>
        <xsl:when test="$sequence = 'even' and $position = 'center'">
			<fo:page-number/>
        </xsl:when>
        <xsl:when test="$sequence = 'even' and $position = 'right'">
        		<xsl:text>&documento;</xsl:text>
        </xsl:when>
        <xsl:when test="$sequence = 'first' and $position = 'left'">
        		<xsl:text>&documento;</xsl:text> 
        </xsl:when>
        <xsl:when test="$sequence = 'first' and $position = 'right'">  
        </xsl:when>
        <xsl:when test="$sequence = 'first' and $position = 'center'"> 
			<fo:page-number/>
        </xsl:when>
        <xsl:when test="$sequence = 'blank' and $position = 'left'">
        		<xsl:text>&documento;</xsl:text>
        </xsl:when>
        <xsl:when test="$sequence = 'blank' and $position = 'center'">
        </xsl:when>
        <xsl:when test="$sequence = 'blank' and $position = 'right'">
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
      <!-- Does runtime parameter turn off blank page footers? -->
      <xsl:choose>
        <xsl:when test="$sequence='blank' and $footers.on.blank.pages=0"> 
          <!-- no output -->
        </xsl:when>
      <!-- titlepages have no footers -->
        <xsl:when test="$pageclass = 'titlepage'">  
          <!-- no output -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:copy-of select="$candidate"/>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

    <!-- Pie de página: tipo de letra y tamaño -->
    
  <xsl:attribute-set name="footer.content.properties">
	  <!--<xsl:attribute name="font-family">Helvetica</xsl:attribute>-->
    <xsl:attribute name="font-size">8pt</xsl:attribute>
  </xsl:attribute-set>

<!-- If non-zero, FOP extensions will be used. At present, this consists of PDF bookmarks. This parameter can also affect which graphics file formats are supported. -->
<xsl:param name="fop1.extensions" select="1"></xsl:param>


<!-- ADMON Modificaciones de los Admonition Graphics fichero admon.xsl AFCF -->

<!-- ADMON Ruta de las viñetas "admon_graphics" usadas en los documentos -->
<xsl:param name="admon.graphics" select="1"/>
<xsl:param name="admon.graphics.path">admon_graphics/</xsl:param>
<xsl:param name="admon.graphics.extension">.png</xsl:param>

<!-- ADMON Tamaño del grafico -->	  
<xsl:template match="*" mode="admon.graphic.width">
  <xsl:param name="node" select="."/>
  <xsl:text>30pt</xsl:text>
</xsl:template>


<!-- ADMON Bordes y separacion del cuadro de los Admonitions -->
<xsl:template name="graphical.admonition">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="graphic.width">
     <xsl:apply-templates select="." mode="admon.graphic.width"/>
  </xsl:variable>
  <fo:block
            border-top="0.5pt solid black"
            border-bottom="1.5pt solid black"
            border-left="0.5pt solid black"
            border-right="1.5pt solid black"
            padding-top="6pt"
            padding-bottom="6pt"
            padding-left="6pt"
            padding-right="6pt"
 
id="{$id}"
            xsl:use-attribute-sets="graphical.admonition.properties">
    <fo:list-block provisional-distance-between-starts="{$graphic.width} + 18pt"
                    provisional-label-separation="18pt">
      <fo:list-item>
          <fo:list-item-label end-indent="label-end()">
            <fo:block>
              <fo:external-graphic width="auto" height="auto"
                                         content-width="{$graphic.width}" >
                <xsl:attribute name="src">
                  <xsl:call-template name="admon.graphic"/>
                </xsl:attribute>
              </fo:external-graphic>
            </fo:block>
          </fo:list-item-label>
          <fo:list-item-body start-indent="body-start()">
            <xsl:if test="$admon.textlabel != 0 or title or info/title">
              <fo:block xsl:use-attribute-sets="admonition.title.properties">
                <xsl:apply-templates select="." mode="object.title.markup">
		  <xsl:with-param name="allow-anchors" select="1"/>
		</xsl:apply-templates>
              </fo:block>
            </xsl:if>
            <fo:block xsl:use-attribute-sets="admonition.properties">
              <xsl:apply-templates/>
            </fo:block>
          </fo:list-item-body>
      </fo:list-item>
    </fo:list-block>
  </fo:block>
</xsl:template>

<!-- Tamaño del texto de titulo del Admonition -->
<xsl:attribute-set name="admonition.title.properties">
  <xsl:attribute name="font-size">10pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
</xsl:attribute-set>

<!-- REVISIONS  Formato del Historico de Revisiones -->
<!-- Modificado por Alvaro Fdez.-Corugedo AFCF -->

<xsl:attribute-set name="revhistory.title.properties">
  <xsl:attribute name="font-size">9pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="revhistory.table.properties">
  <xsl:attribute name="border">0.5pt solid black</xsl:attribute>
  <xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
  <xsl:attribute name="width">100%</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="revhistory.table.cell.properties">
  <xsl:attribute name="border">0.5pt solid black</xsl:attribute>
  <xsl:attribute name="font-size">9pt</xsl:attribute>
  <xsl:attribute name="padding">4pt</xsl:attribute>
</xsl:attribute-set>


<!-- Se incluyen graficos adicionales para los bullets de las listas:
	  en este caso un avioncito AFCF -->
<xsl:template name="itemizedlist.label.markup">
  <xsl:param name="itemsymbol" select="'disc'"/>
  <xsl:choose>
    <xsl:when test="$itemsymbol='none'"></xsl:when>
    <xsl:when test="$itemsymbol='disc'">&#x2022;</xsl:when>
    <xsl:when test="$itemsymbol='bullet'">&#x2022;</xsl:when>
    <xsl:when test="$itemsymbol='endash'">&#x2013;</xsl:when>
    <xsl:when test="$itemsymbol='emdash'">&#x2014;</xsl:when>
    <xsl:when test="$itemsymbol='flecha'"><fo:inline font-family="ZapfDingbats">&#x27A0;</fo:inline></xsl:when>
    <xsl:when test="$itemsymbol='avion'"><fo:inline font-family="ZapfDingbats">&#x2708;</fo:inline></xsl:when>

<!-- INICIO DE TEXTO PARA BOOK.XSL -->
<!-- Poner en la zona de definiciones para los bullets en boox.xsl -->
<xsl:when test="$itemsymbol='caracter2701'"><fo:inline font-family="ZapfDingbats">&#x2701;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2702'"><fo:inline font-family="ZapfDingbats">&#x2702;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2703'"><fo:inline font-family="ZapfDingbats">&#x2703;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2704'"><fo:inline font-family="ZapfDingbats">&#x2704;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2705'"><fo:inline font-family="ZapfDingbats">&#x2705;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2706'"><fo:inline font-family="ZapfDingbats">&#x2706;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2707'"><fo:inline font-family="ZapfDingbats">&#x2707;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2708'"><fo:inline font-family="ZapfDingbats">&#x2708;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2709'"><fo:inline font-family="ZapfDingbats">&#x2709;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter270A'"><fo:inline font-family="ZapfDingbats">&#x270A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter270B'"><fo:inline font-family="ZapfDingbats">&#x270B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter270C'"><fo:inline font-family="ZapfDingbats">&#x270C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter270D'"><fo:inline font-family="ZapfDingbats">&#x270D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter270E'"><fo:inline font-family="ZapfDingbats">&#x270E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter270F'"><fo:inline font-family="ZapfDingbats">&#x270F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2711'"><fo:inline font-family="ZapfDingbats">&#x2711;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2712'"><fo:inline font-family="ZapfDingbats">&#x2712;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2713'"><fo:inline font-family="ZapfDingbats">&#x2713;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2714'"><fo:inline font-family="ZapfDingbats">&#x2714;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2715'"><fo:inline font-family="ZapfDingbats">&#x2715;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2716'"><fo:inline font-family="ZapfDingbats">&#x2716;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2717'"><fo:inline font-family="ZapfDingbats">&#x2717;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2718'"><fo:inline font-family="ZapfDingbats">&#x2718;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2719'"><fo:inline font-family="ZapfDingbats">&#x2719;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter271A'"><fo:inline font-family="ZapfDingbats">&#x271A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter271B'"><fo:inline font-family="ZapfDingbats">&#x271B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter271C'"><fo:inline font-family="ZapfDingbats">&#x271C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter271D'"><fo:inline font-family="ZapfDingbats">&#x271D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter271E'"><fo:inline font-family="ZapfDingbats">&#x271E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter271F'"><fo:inline font-family="ZapfDingbats">&#x271F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2721'"><fo:inline font-family="ZapfDingbats">&#x2721;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2722'"><fo:inline font-family="ZapfDingbats">&#x2722;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2723'"><fo:inline font-family="ZapfDingbats">&#x2723;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2724'"><fo:inline font-family="ZapfDingbats">&#x2724;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2725'"><fo:inline font-family="ZapfDingbats">&#x2725;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2726'"><fo:inline font-family="ZapfDingbats">&#x2726;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2727'"><fo:inline font-family="ZapfDingbats">&#x2727;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2728'"><fo:inline font-family="ZapfDingbats">&#x2728;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2729'"><fo:inline font-family="ZapfDingbats">&#x2729;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter272A'"><fo:inline font-family="ZapfDingbats">&#x272A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter272B'"><fo:inline font-family="ZapfDingbats">&#x272B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter272C'"><fo:inline font-family="ZapfDingbats">&#x272C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter272D'"><fo:inline font-family="ZapfDingbats">&#x272D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter272E'"><fo:inline font-family="ZapfDingbats">&#x272E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter272F'"><fo:inline font-family="ZapfDingbats">&#x272F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2731'"><fo:inline font-family="ZapfDingbats">&#x2731;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2732'"><fo:inline font-family="ZapfDingbats">&#x2732;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2733'"><fo:inline font-family="ZapfDingbats">&#x2733;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2734'"><fo:inline font-family="ZapfDingbats">&#x2734;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2735'"><fo:inline font-family="ZapfDingbats">&#x2735;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2736'"><fo:inline font-family="ZapfDingbats">&#x2736;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2737'"><fo:inline font-family="ZapfDingbats">&#x2737;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2738'"><fo:inline font-family="ZapfDingbats">&#x2738;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2739'"><fo:inline font-family="ZapfDingbats">&#x2739;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter273A'"><fo:inline font-family="ZapfDingbats">&#x273A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter273B'"><fo:inline font-family="ZapfDingbats">&#x273B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter273C'"><fo:inline font-family="ZapfDingbats">&#x273C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter273D'"><fo:inline font-family="ZapfDingbats">&#x273D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter273E'"><fo:inline font-family="ZapfDingbats">&#x273E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter273F'"><fo:inline font-family="ZapfDingbats">&#x273F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2741'"><fo:inline font-family="ZapfDingbats">&#x2741;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2742'"><fo:inline font-family="ZapfDingbats">&#x2742;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2743'"><fo:inline font-family="ZapfDingbats">&#x2743;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2744'"><fo:inline font-family="ZapfDingbats">&#x2744;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2745'"><fo:inline font-family="ZapfDingbats">&#x2745;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2746'"><fo:inline font-family="ZapfDingbats">&#x2746;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2747'"><fo:inline font-family="ZapfDingbats">&#x2747;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2748'"><fo:inline font-family="ZapfDingbats">&#x2748;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2749'"><fo:inline font-family="ZapfDingbats">&#x2749;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter274A'"><fo:inline font-family="ZapfDingbats">&#x274A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter274B'"><fo:inline font-family="ZapfDingbats">&#x274B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter274C'"><fo:inline font-family="ZapfDingbats">&#x274C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter274D'"><fo:inline font-family="ZapfDingbats">&#x274D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter274E'"><fo:inline font-family="ZapfDingbats">&#x274E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter274F'"><fo:inline font-family="ZapfDingbats">&#x274F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2751'"><fo:inline font-family="ZapfDingbats">&#x2751;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2752'"><fo:inline font-family="ZapfDingbats">&#x2752;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2753'"><fo:inline font-family="ZapfDingbats">&#x2753;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2754'"><fo:inline font-family="ZapfDingbats">&#x2754;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2755'"><fo:inline font-family="ZapfDingbats">&#x2755;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2756'"><fo:inline font-family="ZapfDingbats">&#x2756;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2757'"><fo:inline font-family="ZapfDingbats">&#x2757;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2758'"><fo:inline font-family="ZapfDingbats">&#x2758;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2759'"><fo:inline font-family="ZapfDingbats">&#x2759;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter275A'"><fo:inline font-family="ZapfDingbats">&#x275A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter275B'"><fo:inline font-family="ZapfDingbats">&#x275B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter275C'"><fo:inline font-family="ZapfDingbats">&#x275C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter275D'"><fo:inline font-family="ZapfDingbats">&#x275D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter275E'"><fo:inline font-family="ZapfDingbats">&#x275E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter275F'"><fo:inline font-family="ZapfDingbats">&#x275F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2761'"><fo:inline font-family="ZapfDingbats">&#x2761;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2762'"><fo:inline font-family="ZapfDingbats">&#x2762;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2763'"><fo:inline font-family="ZapfDingbats">&#x2763;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2764'"><fo:inline font-family="ZapfDingbats">&#x2764;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2765'"><fo:inline font-family="ZapfDingbats">&#x2765;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2766'"><fo:inline font-family="ZapfDingbats">&#x2766;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2767'"><fo:inline font-family="ZapfDingbats">&#x2767;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2768'"><fo:inline font-family="ZapfDingbats">&#x2768;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2769'"><fo:inline font-family="ZapfDingbats">&#x2769;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter276A'"><fo:inline font-family="ZapfDingbats">&#x276A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter276B'"><fo:inline font-family="ZapfDingbats">&#x276B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter276C'"><fo:inline font-family="ZapfDingbats">&#x276C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter276D'"><fo:inline font-family="ZapfDingbats">&#x276D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter276E'"><fo:inline font-family="ZapfDingbats">&#x276E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter276F'"><fo:inline font-family="ZapfDingbats">&#x276F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2771'"><fo:inline font-family="ZapfDingbats">&#x2771;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2772'"><fo:inline font-family="ZapfDingbats">&#x2772;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2773'"><fo:inline font-family="ZapfDingbats">&#x2773;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2774'"><fo:inline font-family="ZapfDingbats">&#x2774;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2775'"><fo:inline font-family="ZapfDingbats">&#x2775;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2776'"><fo:inline font-family="ZapfDingbats">&#x2776;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2777'"><fo:inline font-family="ZapfDingbats">&#x2777;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2778'"><fo:inline font-family="ZapfDingbats">&#x2778;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2779'"><fo:inline font-family="ZapfDingbats">&#x2779;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter277A'"><fo:inline font-family="ZapfDingbats">&#x277A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter277B'"><fo:inline font-family="ZapfDingbats">&#x277B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter277C'"><fo:inline font-family="ZapfDingbats">&#x277C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter277D'"><fo:inline font-family="ZapfDingbats">&#x277D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter277E'"><fo:inline font-family="ZapfDingbats">&#x277E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter277F'"><fo:inline font-family="ZapfDingbats">&#x277F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2781'"><fo:inline font-family="ZapfDingbats">&#x2781;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2782'"><fo:inline font-family="ZapfDingbats">&#x2782;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2783'"><fo:inline font-family="ZapfDingbats">&#x2783;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2784'"><fo:inline font-family="ZapfDingbats">&#x2784;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2785'"><fo:inline font-family="ZapfDingbats">&#x2785;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2786'"><fo:inline font-family="ZapfDingbats">&#x2786;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2787'"><fo:inline font-family="ZapfDingbats">&#x2787;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2788'"><fo:inline font-family="ZapfDingbats">&#x2788;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2789'"><fo:inline font-family="ZapfDingbats">&#x2789;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter278A'"><fo:inline font-family="ZapfDingbats">&#x278A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter278B'"><fo:inline font-family="ZapfDingbats">&#x278B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter278C'"><fo:inline font-family="ZapfDingbats">&#x278C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter278D'"><fo:inline font-family="ZapfDingbats">&#x278D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter278E'"><fo:inline font-family="ZapfDingbats">&#x278E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter278F'"><fo:inline font-family="ZapfDingbats">&#x278F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2791'"><fo:inline font-family="ZapfDingbats">&#x2791;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2792'"><fo:inline font-family="ZapfDingbats">&#x2792;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2793'"><fo:inline font-family="ZapfDingbats">&#x2793;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2794'"><fo:inline font-family="ZapfDingbats">&#x2794;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2795'"><fo:inline font-family="ZapfDingbats">&#x2795;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2796'"><fo:inline font-family="ZapfDingbats">&#x2796;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2797'"><fo:inline font-family="ZapfDingbats">&#x2797;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2798'"><fo:inline font-family="ZapfDingbats">&#x2798;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter2799'"><fo:inline font-family="ZapfDingbats">&#x2799;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter279A'"><fo:inline font-family="ZapfDingbats">&#x279A;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter279B'"><fo:inline font-family="ZapfDingbats">&#x279B;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter279C'"><fo:inline font-family="ZapfDingbats">&#x279C;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter279D'"><fo:inline font-family="ZapfDingbats">&#x279D;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter279E'"><fo:inline font-family="ZapfDingbats">&#x279E;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter279F'"><fo:inline font-family="ZapfDingbats">&#x279F;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A1'"><fo:inline font-family="ZapfDingbats">&#x27A1;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A2'"><fo:inline font-family="ZapfDingbats">&#x27A2;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A3'"><fo:inline font-family="ZapfDingbats">&#x27A3;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A4'"><fo:inline font-family="ZapfDingbats">&#x27A4;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A5'"><fo:inline font-family="ZapfDingbats">&#x27A5;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A6'"><fo:inline font-family="ZapfDingbats">&#x27A6;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A7'"><fo:inline font-family="ZapfDingbats">&#x27A7;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A8'"><fo:inline font-family="ZapfDingbats">&#x27A8;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27A9'"><fo:inline font-family="ZapfDingbats">&#x27A9;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27AA'"><fo:inline font-family="ZapfDingbats">&#x27AA;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27AB'"><fo:inline font-family="ZapfDingbats">&#x27AB;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27AC'"><fo:inline font-family="ZapfDingbats">&#x27AC;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27AD'"><fo:inline font-family="ZapfDingbats">&#x27AD;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27AE'"><fo:inline font-family="ZapfDingbats">&#x27AE;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27AF'"><fo:inline font-family="ZapfDingbats">&#x27AF;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B1'"><fo:inline font-family="ZapfDingbats">&#x27B1;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B2'"><fo:inline font-family="ZapfDingbats">&#x27B2;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B3'"><fo:inline font-family="ZapfDingbats">&#x27B3;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B4'"><fo:inline font-family="ZapfDingbats">&#x27B4;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B5'"><fo:inline font-family="ZapfDingbats">&#x27B5;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B6'"><fo:inline font-family="ZapfDingbats">&#x27B6;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B7'"><fo:inline font-family="ZapfDingbats">&#x27B7;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B8'"><fo:inline font-family="ZapfDingbats">&#x27B8;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27B9'"><fo:inline font-family="ZapfDingbats">&#x27B9;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27BA'"><fo:inline font-family="ZapfDingbats">&#x27BA;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27BB'"><fo:inline font-family="ZapfDingbats">&#x27BB;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27BC'"><fo:inline font-family="ZapfDingbats">&#x27BC;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27BD'"><fo:inline font-family="ZapfDingbats">&#x27BD;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27BE'"><fo:inline font-family="ZapfDingbats">&#x27BE;</fo:inline></xsl:when>
<xsl:when test="$itemsymbol='caracter27BF'"><fo:inline font-family="ZapfDingbats">&#x27BF;</fo:inline></xsl:when>
<!-- FINAL DE TEXTO PARA BOOK.XSL -->    

    <xsl:otherwise>&#x2022;</xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- Correccion de texto generado. El testo de la fecha de publicación se ha sustituido
		de "fecha de publicación" a "Fecha de publicación del documento:" -->
<xsl:param name="local.l10n.xml" select="document('')"/>
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
	 <l:l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="es" english-language-name="Spanish">
    <l:gentext key="pubdate" text="Fecha de publicación del documento:"/>
    <!-- other customizations here -->
  </l:l10n>
</l:i18n>


</xsl:stylesheet>
