<?xml version="1.0" encoding="utf-8"?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>http://www.zentralplus.ch</loc>
        <lastmod>{{ $smarty.now|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>hourly</changefreq>
        <priority>1.0</priority>
    </url>
{{ set_publication identifier="2" }}
{{ set_current_issue }}    
{{ list_sections constraints="number not 71 number not 72 number not 80 number not 200 number not 210 number not 220 number not 300 number not 500" }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="section" }}</loc>
        <changefreq>daily</changefreq>
        <priority>0.4</priority>
    </url>
{{ /list_sections }}     
{{ list_articles ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is news" }}
    {{ if $gimme->article->section->defined && $gimme->article->section->identifier > 0 }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="article" }}</loc>
        <lastmod>{{ $gimme->article->publish_date|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.8</priority>
    </url>
    {{ /if }}
{{ /list_articles }}
{{* list_articles ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is newswire" }}
    {{ if $gimme->article->section->defined && $gimme->article->section->identifier > 0 }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="article" }}</loc>
        <lastmod>{{ $gimme->article->publish_date|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.7</priority>
    </url>
    {{ /if }}
{{ /list_articles *}}
{{ list_articles ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is debatte" }}
    {{ if $gimme->article->section->defined && $gimme->article->section->identifier > 0 }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="section" }}</loc>
        <lastmod>{{ $gimme->article->publish_date|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.9</priority>
    </url>
    {{ /if }}
{{ /list_articles }}
{{ list_articles ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is dossier" }}
    {{ if $gimme->article->section->defined && $gimme->article->section->identifier > 0 }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="article" }}</loc>
        <lastmod>{{ $gimme->article->publish_date|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.9</priority>
    </url>
    {{ /if }}
{{ /list_articles }}
{{ list_articles ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is restaurant" }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="article" }}</loc>
        <lastmod>{{ $gimme->article->publish_date|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.6</priority>
    </url>
{{ /list_articles }}
</urlset>
