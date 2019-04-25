<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    <xsl:variable name="title">
        <xsl:value-of select="normalize-space(string-join(//tei:titleStmt[1]/tei:title//text(), ' '))"/>
    </xsl:variable>
    <xsl:variable name="prev">
        <xsl:value-of select="//data(tei:TEI/@prev)"/>
    </xsl:variable>
    <xsl:variable name="next">
        <xsl:value-of select="//data(tei:TEI/@next)"/>
    </xsl:variable>
    <xsl:variable name="current-id">
        <xsl:value-of select="//data(tei:TEI/@xml:id)"/>
    </xsl:variable>
    <xsl:variable name="current-base">
        <xsl:value-of select="//data(tei:TEI/@xml:base)"/>
    </xsl:variable>
    <xsl:variable name="current">
        <xsl:choose>
            <xsl:when test="ends-with($current-base, '/')">
                <xsl:value-of select="string-join(($current-base, $current-id), '')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="string-join(($current-base, $current-id), '/')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="/">
        <html lang="en-US">
            <head>
                <meta charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <meta name="mobile-web-app-capable" content="yes"/>
                <meta name="apple-mobile-web-app-capable" content="yes"/>
                <meta name="apple-mobile-web-app-title" content="Fundament WP - Example HTML Page"/>
                <link rel="profile" href="http://gmpg.org/xfn/11"/>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <link rel="stylesheet" id="fundament-styles"  href="https://shared.acdh.oeaw.ac.at/fundament/dist/fundament/css/fundament.min.css" type="text/css"/>
            </head>
            <body class="home">
                <div class="hfeed site" id="page">
                    <!-- ******************* The Navbar Area ******************* -->
                    <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" itemscope="" itemtype="http://schema.org/WebSite">
                        <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="container-fluid" >
                                <!-- Your site title as branding in the menu -->
                                <a href="/" class="navbar-brand custom-logo-link" rel="home" itemprop="url"></a><!-- end custom logo -->
                                <a class="navbar-brand site-title-with-logo" rel="home" href="#" title="Thun" itemprop="url">Thun</a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                    <!-- Your menu goes here -->
                                    <ul id="main-menu" class="navbar-nav">
                                        <li class="nav-item active"><a title="Home" href="/" class="nav-link">Home</a></li>
                                        <li class="nav-item dropdown">
                                            <a title="Dropdown" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Dropdown <span class="caret"></span></a>
                                            <ul class=" dropdown-menu" role="menu">
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Level 1" href="#" class="nav-link">Level 1</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item"><a title="Documentation" href="#" class="nav-link">Documentation</a></li>
                                    </ul>
                                    <div class="form-inline my-2 my-lg-0 navbar-search-form">
                                        <input class="form-control navbar-search" id="query" type="text" placeholder="Search" value="" autocomplete="off"/>
                                        <button class="navbar-search-icon" id="send" data-toggle="modal" data-target="#myModal">
                                            <i data-feather="search"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- .collapse navbar-collapse -->
                            </div>
                            <!-- .container -->
                        </nav>
                        <!-- .site-navigation -->
                    </div>
                    <!-- .wrapper-navbar end -->
                    
                    <div class="wrapper" id="index-wrapper">
                        <div class="container" id="content" tabindex="-1">
                            <div class="card">
                                <div class="card-header">
                                    <div class="row" style="text-align:left">
                                        <div class="col-md-2">
                                            <xsl:if test="$prev">
                                                <h1>
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:value-of select="$prev"/>
                                                        </xsl:attribute>
                                                        <emph data-feather="chevron-left"/>
                                                    </a>
                                                </h1>
                                            </xsl:if>
                                        </div>
                                        <div class="col-md-8">
                                            <h2 align="center">
                                                <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:title">
                                                    <xsl:apply-templates/>
                                                    <br/>
                                                </xsl:for-each>
                                            </h2>
                                            <h3 align="center">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <a>
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="$current"/>
                                                            </xsl:attribute>
                                                            <emph data-feather="home"/>
                                                        </a>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <emph data-feather="info" data-toggle="modal" data-target="#exampleModalLong"/>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <a>
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="concat($current, '?format=raw')"/>
                                                            </xsl:attribute>
                                                            <emph data-feather="download"/>
                                                        </a>
                                                    </div>
                                                </div>
                                                
                                            </h3>
                                        </div>
                                        <div class="col-md-2" style="text-align:right">
                                            <xsl:if test="$next">
                                                <h1>
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:value-of select="$next"/>
                                                        </xsl:attribute>
                                                        <emph data-feather="chevron-right" title="next"/>
                                                    </a>
                                                </h1>
                                            </xsl:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <xsl:apply-templates select="//tei:body"/>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <xsl:for-each select=".//tei:note">
                                        <div class="footnotes">
                                            <xsl:element name="a">
                                                <xsl:attribute name="name">
                                                    <xsl:text>fn</xsl:text>
                                                    <xsl:number level="any" format="1" count="tei:note"/>
                                                </xsl:attribute>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:text>#fna_</xsl:text>
                                                        <xsl:number level="any" format="1" count="tei:note"/>
                                                    </xsl:attribute>
                                                    <span style="font-size:7pt;vertical-align:super;">
                                                        <xsl:number level="any" format="1" count="tei:note"/>
                                                    </span>
                                                </a>
                                            </xsl:element>
                                            <xsl:apply-templates/>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>
                        <!-- Container end -->
                    </div>
                    <!-- Wrapper end -->
                    <div class="wrapper fundament-default-footer" id="wrapper-footer-full">
                        <div class="container" id="footer-full-content" tabindex="-1">
                            <div class="footer-separator">
                                <i data-feather="message-circle"></i> CONTACT
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a href="https://www.oeaw.ac.at/acdh/acdh-home/" target="_blank" rel="noopener" aria-label="ACDH">
                                        <img src="https://shared.acdh.oeaw.ac.at/thun/logos/acdh_logo.png" alt="ACDH" title="Austrian Centre for Digital Humanities"/>
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="https://pf.fwf.ac.at/de/wissenschaft-konkret/project-finder?search[what]=P+22554" target="_blank" rel="noopener" aria-label="FWF P 29329">
                                        <img src="https://shared.acdh.oeaw.ac.at/thun/logos/fwf.gif" alt="FWF" title="FWF funded Project P 22554"/>
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="http://www.oesterreichische-geschichte.at/" target="_blank" rel="noopener" aria-label="Kommission für Neuere Geschichte Österreichs">
                                        <img src="https://shared.acdh.oeaw.ac.at/thun/logos/logo_kommission.png" alt="Kommission für Neuere Geschichte Österreichs" title="Kommission für Neuere Geschichte Österreichs" style="max-width:30%;"/>
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="https://www.uibk.ac.at/" target="_blank" rel="noopener" aria-label="UIBK">
                                        <img src="https://shared.acdh.oeaw.ac.at/thun/logos/uibklogo.png" alt="UIBK" title="University of Innsbruck"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- #wrapper-footer-full -->
                    <div class="footer-imprint-bar" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;">
                       <a href="https://www.oeaw.ac.at/die-oeaw/impressum/">Impressum/Imprint</a>
                    </div>
                </div>
                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Ergebniss der Volltextsuche</h4>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <table id="table" class="display" style="width:60vw">
                                    <thead>
                                        <tr id="columns">
                                            <th>Title</th>
                                            <th>Highlight</th>
                                            <th>Type</th>
                                        </tr>
                                    </thead>
                                </table>
                                <div id="output"></div>
                            </div>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Schließen</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
                <div class="modal fade bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog  modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">
                                    <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:title">
                                        <xsl:apply-templates/>
                                        <br/>
                                    </xsl:for-each>
                                </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">x</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <tbody>
                                        <xsl:if test="//tei:msIdentifier">
                                            <tr>
                                                <th>
                                                    <abbr title="//tei:msIdentifie">Signatur</abbr>
                                                </th>
                                                <td>
                                                    <xsl:for-each select="//tei:msIdentifier/child::*">
                                                        <abbr>
                                                            <xsl:attribute name="title">
                                                                <xsl:value-of select="name()"/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select="."/>
                                                        </abbr>
                                                        <br/>
                                                    </xsl:for-each><!--<xsl:apply-templates select="//tei:msIdentifier"/>-->
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="//tei:msContents">
                                            <tr>
                                                <th>
                                                    <abbr title="//tei:msContents">Regest</abbr>
                                                </th>
                                                <td>
                                                    <xsl:apply-templates select="//tei:msContents"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="//tei:supportDesc/tei:extent">
                                            <tr>
                                                <th>
                                                    <abbr title="//tei:supportDesc/tei:extent">Extent</abbr>
                                                </th>
                                                <td>
                                                    <xsl:apply-templates select="//tei:supportDesc/tei:extent"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <tr>
                                            <th>Schlagworte</th>
                                            <td>
                                                <xsl:for-each select="//tei:index/tei:term">
                                                    <li>
                                                        <xsl:value-of select="."/>
                                                    </li>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <abbr title="//tei:availability//tei:p[1]">License</abbr>
                                            </th>
                                            <td align="center">
                                                <a class="navlink" target="_blank" href="https://creativecommons.org/licenses/by/4.0/">
                                                    https://creativecommons.org/licenses/by/4.0/
                                                </a>
                                            </td>
                                        </tr>                            
                                    </tbody>
                                </table>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- #page we need this extra closing tag here -->
                <script type="text/javascript" src="https://shared.acdh.oeaw.ac.at/fundament/dist/fundament/vendor/jquery/jquery.min.js"></script>
                <script type="text/javascript" src="https://shared.acdh.oeaw.ac.at/fundament/dist/fundament/js/fundament.min.js"></script>
                <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" charset="utf-8"></script>
                <script src="https://shared.acdh.oeaw.ac.at/solr-getter/solr.js"></script>
                <script>
                    $( document ).ready(function() {
                        $('#send').click(function() {
                            getSolr({
                               solrEndpoint: 'https://arche.acdh.oeaw.ac.at/solr/arche/query',
                               pageSize: 25,
                               input: $("#query").val(),
                               columns: [
                               { 'Type': 'content_type' },
                               { 'column label': 'solr_object_key' },
                               { 'Title': 'meta_title' },
                               { 'highlight': 'highlight_with_link' }
                               ],                        
                            });
                        });
                    });
                </script>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="//*[starts-with(local-name(), 'list')]">
            <h1>
                <xsl:value-of select="local-name(.)"/>
            </h1>
            <ul>
                <xsl:for-each select="child::*">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        
    </xsl:template>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<!--    the following code is copied from resources/xslt/shared/base.xsl-->
    <xsl:template match="tei:back"/>
    <xsl:template match="tei:date[@*]">
        <abbr>
            <xsl:attribute name="title">
                <xsl:value-of select="data(./@*)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </abbr>
    </xsl:template>
    <xsl:template match="tei:term">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='ul'">
                <u>
                    <xsl:apply-templates/>
                </u>
            </xsl:when>
            <xsl:when test="@rend='superscript'">
                <sup>
                    <xsl:apply-templates/>
                </sup>
            </xsl:when>
            <xsl:when test="@rend='strikethrough'">
                <strike>
                    <xsl:apply-templates/>
                </strike>
            </xsl:when>
            <xsl:when test="@rend='italic'">
                <i>
                    <xsl:apply-templates/>
                </i>
            </xsl:when>
            <xsl:when test="@rend='sup'">
                <sup>
                    <xsl:apply-templates/>
                </sup>
            </xsl:when>
            <xsl:otherwise>
                <span>
                    <xsl:attribute name="style">
                        <xsl:value-of select="@rend"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--    footnotes -->   
    <xsl:template match="tei:note">
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:text>fna_</xsl:text>
                <xsl:number level="any" format="1" count="tei:note"/>
            </xsl:attribute>
            <xsl:attribute name="href">
                <xsl:text>#fn</xsl:text>
                <xsl:number level="any" format="1" count="tei:note"/>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
            <span style="font-size:7pt;vertical-align:super;">
                <xsl:number level="any" format="1" count="tei:note"/>
            </span>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:div">
        <xsl:choose>
            <xsl:when test="@type='regest'">
                <div>
                    <xsl:attribute name="class">
                        <text>regest</text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <!-- transcript -->
            <xsl:when test="@type='transcript'">
                <div>
                    <xsl:attribute name="class">
                        <text>transcript</text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </div>
            </xsl:when><!-- Anlagen/Beilagen  -->
            <xsl:when test="@xml:id">
                <xsl:element name="div">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template><!-- Verweise auf andere Dokumente   -->
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="@target[ends-with(.,'.xml')]">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                       show.html?ref=<xsl:value-of select="tokenize(./@target, '/')[4]"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template><!-- resp -->
    <xsl:template match="tei:respStmt/tei:resp">
        <xsl:apply-templates/> 
    </xsl:template>
    <xsl:template match="tei:respStmt/tei:name">
        <xsl:for-each select=".">
            <li>
                <xsl:apply-templates/>
            </li>
        </xsl:for-each>
    </xsl:template><!-- reference strings   -->
    
    <xsl:template match="*[starts-with(data(@ref), '#')]">
        <xsl:variable name="xml-id">
            <xsl:value-of select="substring-after(data(@ref), '#')"/>
        </xsl:variable>
        <xsl:variable name="index-entry">
            <xsl:value-of select="normalize-space(string-join(//*[@xml:id=$xml-id]//text(), ' '))"/>
        </xsl:variable>
        <abbr title="{$index-entry}">
            <xsl:apply-templates/>
        </abbr>
    </xsl:template>
    
    <xsl:template match="*[not(starts-with(data(@ref), '#'))][@ref]">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!-- additions -->
    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="style">
                <xsl:text>color:blue;</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:choose>
                    <xsl:when test="@place='margin'">
                        <xsl:text>zeitgenössische Ergänzung am Rand</xsl:text>(<xsl:value-of select="./@place"/>).
                    </xsl:when>
                    <xsl:when test="@place='above'">
                        <xsl:text>zeitgenössische Ergänzung oberhalb</xsl:text>(<xsl:value-of select="./@place"/>)
                    </xsl:when>
                    <xsl:when test="@place='below'">
                        <xsl:text>zeitgenössische Ergänzung unterhalb</xsl:text>(<xsl:value-of select="./@place"/>)
                    </xsl:when>
                    <xsl:when test="@place='inline'">
                        <xsl:text>zeitgenössische Ergänzung in der gleichen Zeile</xsl:text>(<xsl:value-of select="./@place"/>)
                    </xsl:when>
                    <xsl:when test="@place='top'">
                        <xsl:text>zeitgenössische Ergänzung am oberen Blattrand</xsl:text>(<xsl:value-of select="./@place"/>)
                    </xsl:when>
                    <xsl:when test="@place='bottom'">
                        <xsl:text>zeitgenössische Ergänzung am unteren Blattrand</xsl:text>(<xsl:value-of select="./@place"/>)
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>zeitgenössische Ergänzung am unteren Blattrand</xsl:text>(<xsl:value-of select="./@place"/>)
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:text/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template><!-- Bücher -->
    <xsl:template match="tei:bibl">
        <xsl:element name="strong">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template><!-- Seitenzahlen -->
    <xsl:template match="tei:pb">
        <xsl:element name="div">
            <xsl:attribute name="style">
                <xsl:text>text-align:right;</xsl:text>
            </xsl:attribute>
            <xsl:text>[Bl.</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </xsl:element>
        <xsl:element name="hr"/>
    </xsl:template><!-- Tabellen -->
    <xsl:template match="tei:table">
        <xsl:element name="table">
            <xsl:attribute name="class">
                <xsl:text>table table-bordered table-striped table-condensed table-hover</xsl:text>
            </xsl:attribute>
            <xsl:element name="tbody">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:row">
        <xsl:element name="tr">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:cell">
        <xsl:element name="td">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template><!-- Überschriften -->
    <xsl:template match="tei:head">
        <xsl:if test="@xml:id[starts-with(.,'org') or starts-with(.,'ue')]">
            <a>
                <xsl:attribute name="name">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:text> </xsl:text>
            </a>
        </xsl:if>
        <a>
            <xsl:attribute name="name">
                <xsl:text>hd</xsl:text>
                <xsl:number level="any"/>
            </xsl:attribute>
            <xsl:text> </xsl:text>
        </a>
        <h3>
            <div>
                <xsl:apply-templates/>
            </div>
        </h3>
    </xsl:template><!--  Quotes / Zitate -->
    <xsl:template match="tei:q">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template><!-- Zeilenumbürche   -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template><!-- Absätze    -->
    <xsl:template match="tei:p">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template><!-- Durchstreichungen -->
    <xsl:template match="tei:del">
        <xsl:element name="strike">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:origDate[@notBefore and @notAfter]">
        <xsl:variable name="dates">
            <xsl:value-of select="./@*" separator="-"/>
        </xsl:variable>
        <abbr title="{$dates}">
            <xsl:value-of select="."/>
        </abbr>
    </xsl:template>
    <xsl:template match="tei:extent">
        <xsl:apply-templates select="./tei:measure"/>
        <xsl:apply-templates select="./tei:dimensions"/>
    </xsl:template>
    <xsl:template match="tei:measure">
        <xsl:variable name="x">
            <xsl:value-of select="./@type"/>
        </xsl:variable>
        <xsl:variable name="y">
            <xsl:value-of select="./@quantity"/>
        </xsl:variable>
        <abbr title="type: {$x}, quantity: {$y}">Measure</abbr>: <xsl:value-of select="./text()"/>
        <br/>
    </xsl:template>
    <xsl:template match="tei:dimensions">
        <xsl:variable name="x">
            <xsl:value-of select="./@type"/>
        </xsl:variable>
        <xsl:variable name="y">
            <xsl:value-of select="./@unit"/>
        </xsl:variable>
        <abbr title="type: {$x}">Dimensions:</abbr> h: <xsl:value-of select="./tei:height/text()"/>
        <xsl:value-of select="$y"/>, w: <xsl:value-of select="./tei:width/text()"/>
        <xsl:value-of select="$y"/>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:layoutDesc">
        <xsl:for-each select="tei:layout">
            <div>
                <xsl:value-of select="./@columns"/> Column(s) à <xsl:value-of select="./@ruledLines |./@writtenLines"/> ruled/written lines:
                <xsl:apply-templates/>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:locus">
        <xsl:variable name="folio-from-id">
            <xsl:value-of select="./@from"/>
        </xsl:variable>
        <xsl:variable name="folio-to-id">
            <xsl:value-of select="./@to"/>
        </xsl:variable>
        <xsl:variable name="url-from-facs">
            <xsl:value-of select="./ancestor::tei:TEI//tei:graphic[@n=$folio-from-id]/@url"/>
        </xsl:variable>
        <xsl:variable name="url-to-facs">
            <xsl:value-of select="./ancestor::tei:TEI//tei:graphic[@n=$folio-to-id]/@url"/>
        </xsl:variable>
        <a href="{$url-from-facs}">
            <xsl:value-of select="$folio-from-id"/>
        </a>-<a href="{$url-to-facs}">
            <xsl:value-of select="./@to"/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:handDesc">
        <xsl:for-each select="./tei:handNote">
            <div>
                <xsl:apply-templates/>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:title">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
    
    <xsl:template match="tei:scriptDesc">
        <xsl:for-each select="./tei:scriptNote">
            <div>
                Type: <xsl:value-of select="./@script"/>
                <xsl:apply-templates/>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:bindingDesc">
        <xsl:for-each select="./tei:binding">
            <div>
                Date: <xsl:value-of select="./@notBefore"/>-<xsl:value-of select="./@notAfter"/>
                <xsl:apply-templates/>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:listBibl">
        <xsl:for-each select=".//tei:bibl">
            <li>
                <xsl:apply-templates/>
            </li>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:ptr">
        <xsl:variable name="x">
            <xsl:value-of select="./@target"/>
        </xsl:variable>
        <a href="{$x}" class="fas fa-link"/>
    </xsl:template>
    
    <xsl:template match="tei:msPart">
        <xsl:variable name="x">
            <xsl:number count="." level="any"/>
        </xsl:variable>
        <div class="card-header" id="mspart_{$x}">
            <div class="card-header">
                    <h4 align="center">
                        <xsl:value-of select="./tei:msIdentifier"/>
                        <xsl:value-of select="./tei:head"/>
                    </h4>
            </div>
            <div class="card-body">
                <xsl:apply-templates select=".//tei:msContents"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:msContents">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:msItem">
        <xsl:variable name="x">
            <xsl:number level="any" count="tei:msItem"/>
        </xsl:variable>
        <h5 id="msitem_{$x}">
            Manuscript Item Nr: <xsl:value-of select="$x"/>
        </h5>
        <table class="table table-condensed table-bordered">
            <thead>
                <tr>
                    <th width="20%">Key</th>
                    <th>Value</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>locus</th>
                    <td>
                        <xsl:apply-templates select="./tei:locus"/>
                    </td>
                </tr>
                <xsl:if test="./tei:note">
                    <tr>
                        <th>notes</th>
                        <td>
                            <xsl:apply-templates select="./tei:note"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:author">
                    <tr>
                        <th>author</th>
                        <td>
                            <xsl:apply-templates select="./tei:author"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:title">
                    <tr>
                        <th>title</th>
                        <td>
                            <xsl:apply-templates select="./tei:title"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:incipit">
                    <tr>
                        <th>incipit</th>
                        <td>
                            <xsl:apply-templates select="./tei:incipit"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:explicit">
                    <tr>
                        <th>explicit</th>
                        <td>
                            <xsl:apply-templates select="./tei:explicit"/>
                        </td>
                    </tr>
                 </xsl:if>
                <xsl:if test="./tei:finalRubric">
                    <tr>
                        <th>finalRubric</th>
                        <td>
                            <xsl:apply-templates select="./tei:finalRubric"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:bibl">
                    <tr>
                        <th>Bibliography</th>
                        <td>
                            <xsl:apply-templates select="./tei:bibl"/>
                        </td>
                    </tr>
                </xsl:if>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="tei:gi">
        <code>
            <xsl:apply-templates/>
        </code>
    </xsl:template>
 
</xsl:stylesheet>