<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:saxon="http://saxon.sf.net/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" saxon:cdata-section-elements="script"/>
    <xsl:variable name="arche-gui">https://arche-curation.acdh-dev.oeaw.ac.at/browser/oeaw_detail/</xsl:variable>
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
                <link rel="stylesheet" id="fundament-styles" href="https://shared.acdh.oeaw.ac.at/fundament/dist/fundament/css/fundament.min.css" type="text/css"/>
            </head>
            <body class="home">
                <div class="hfeed site" id="page">
                    <!-- ******************* The Navbar Area ******************* -->
                    <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" itemscope="" itemtype="http://schema.org/WebSite">
                        <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="container-fluid">
                                <!-- Your site title as branding in the menu -->
                                <a href="/" class="navbar-brand custom-logo-link" rel="home" itemprop="url"/><!-- end custom logo -->
                                <a class="navbar-brand site-title-with-logo" rel="home" href="#" title="Thun" itemprop="url">Thun</a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"/>
                                </button>
                                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                    <!-- Your menu goes here -->
                                    <ul id="main-menu" class="navbar-nav">
                                        <li class="nav-item dropdown">
                                            <a title="Dropdown" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Info<span class="caret"/>
                                            </a>
                                            <ul class=" dropdown-menu" role="menu">
                                                <li class="nav-item dropdown-submenu">
                                                    <a href="https://id.acdh.oeaw.ac.at/thun/meta/about.xml?format=customTEI2HTML" class="nav-link">Über diese Edition</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a href="#" class="nav-link">Inhalt</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a href="#" class="nav-link">Dissemination Service</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a title="Dropdown" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Register <span class="caret"/>
                                            </a>
                                            <ul class=" dropdown-menu" role="menu">
                                                <li class="nav-item dropdown-submenu">
                                                    <a href="https://id.acdh.oeaw.ac.at/thun/indices/listperson.xml?format=customTEI2HTML" class="nav-link">Personen</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a href="https://id.acdh.oeaw.ac.at/thun/indices/listplace.xml?format=customTEI2HTML" class="nav-link">Orte</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a href="https://id.acdh.oeaw.ac.at/thun/indices/listPlace.xml?format=customTEI2HTML" class="nav-link">Institutionen</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <div class="form-inline my-2 my-lg-0 navbar-search-form">
                                        <input class="form-control navbar-search" id="query" type="text" placeholder="Search" value="" autocomplete="off"/>
                                        <button class="navbar-search-icon" id="send" data-toggle="modal" data-target="#myModal">
                                            <i data-feather="search"/>
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
                                                            <xsl:value-of select="concat($prev, '?format=customTEI2HTML')"/>
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
                                                            <xsl:value-of select="concat($next, '?format=customTEI2HTML')"/>
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
                                        <xsl:apply-templates select="//tei:listPlace"/>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <!-- Container end -->
                    </div>
                    <!-- Wrapper end -->
                    <div class="wrapper fundament-default-footer" id="wrapper-footer-full">
                        <div class="container" id="footer-full-content" tabindex="-1">
                            <div class="footer-separator">
                                <i data-feather="message-circle"/> CONTACT
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
                                <table id="table" class="table table-striped table-condensed table-hover">
                                    <thead>
                                        <tr id="columns">
                                            <th>Title</th>
                                            <th>Highlight</th>
                                            <th>Type</th>
                                        </tr>
                                    </thead>
                                </table>
                                <div id="output"/>
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
                <script type="text/javascript" src="https://shared.acdh.oeaw.ac.at/fundament/dist/fundament/vendor/jquery/jquery.min.js"/>
                <script type="text/javascript" src="https://shared.acdh.oeaw.ac.at/fundament/dist/fundament/js/fundament.min.js"/>
                <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.16/b-1.4.2/b-html5-1.4.2/b-print-1.4.2/datatables.min.js"/>
                <script src="https://shared.acdh.oeaw.ac.at/solr-getter/solr.js"/>
                <script>
                    <![CDATA[
                    $( document ).ready(function() {
                        $('#send').click(function() {
                            getSolr({
                               solrEndpoint: 'https://arche-curation.acdh-dev.oeaw.ac.at/solr/arche/query',
                               pageSize: 25,
                               input: $("#query").val(),
                               columns: [
                               { 'Type': 'content_type' },
                               { 'Title': 'meta_title' },
                               { 'highlight': 'highlight_with_link' }
                               ],
                               sparqlQuery: decodeURIComponent('select%20%3Fres%20where%20%7B%0A%20%20%3Fres%20%3Chttps%3A%2F%2Fvocabs.acdh.oeaw.ac.at%2Fschema%23isPartOf%3E%20%3Chttps%3A%2F%2Fid.acdh.oeaw.ac.at%2Fuuid%2Fc43b6f9c-63d1-ee81-ceec-c08bd8506cef%3E%20.%0A%7D'),
                               sparqlEndpoint: 'https://arche-curation.acdh-dev.oeaw.ac.at/blazegraph/sparql',
                            });
                        });
                    });
                    ]]>
                </script>
                <script>
                    var listpersontable = $('#persontable').DataTable({
                    "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
                    },
                    "pageLength": 50,
                    dom: 'Bfrtip',
                    buttons: [
                    'copy', 'excel', 'pdf'
                    ]
                    });

                </script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match=".//tei:listPlace">
        <table id="persontable" class="table table-striped table-condensed table-hover">
            <thead>
                <tr id="columns">
                    <th>Name</th>
                    <th>Alternative Namen</th>
                    <th>Koordinaten</th>
                    <th>Normdaten</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select=".//tei:place[./@xml:id]">
                    <tr>
                        <td>
                            <a href="{concat('https://id.acdh.oeaw.ac.at/thun/institutions/', data(./@xml:id))}">
                                <xsl:value-of select=".//tei:placeName[1]/text()"/>
                            </a>
                        </td>
                        <td>
                            <xsl:for-each select=".//subsequence(.//tei:placeName, 2)">
                                <li>
                                    <xsl:value-of select="./text()"/>
                                </li>
                            </xsl:for-each>
                        </td>
                        <td>
                            <xsl:value-of select=".//tei:geo/text()"/>
                        </td>
                        <td>
                            <xsl:value-of select=".//tei:idno/text()"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:title">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
</xsl:stylesheet>