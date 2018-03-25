declare default element namespace "urn:isbn:1-931666-22-9";
<findingAids>
{for $ead in collection("file:/Users/miapartlow/Documents/MLSdegree/DigitalPublishing/xquery-assignment?*.xml")/ead
order by number(data(substring-before($ead/archdesc/did/physdesc/extent, ' cubic'))) descending
return 
<findingAid>
<id>{data($ead/eadheader/eadid)}</id>
<title>{data($ead/eadheader/filedesc/titlestmt/titleproper)}</title>
<dateSpan>
 {
number(data(substring-after($ead/eadheader/filedesc/titlestmt/titleproper/date, '-'))) - number(data(substring-before($ead/eadheader/filedesc/titlestmt/titleproper/date, '-')))
 }</dateSpan>
<creator> { data(substring-after($ead/eadheader/filedesc/titlestmt/author, 'by'))}  </creator>
<revisions> {
count(data($ead/eadheader/revisiondesc/change))
}
</revisions>
<extent>
{
data($ead/archdesc/did/physdesc/extent)
}
</extent>

<access> 
{
string-join($ead/archdesc/accessrestrict/p, '| ')
}
</access>

<indexingTerms>
{for $indexing in $ead/archdesc/controlaccess/controlaccess/list/item/extref
return
<term>
{data(normalize-space($indexing))}
</term>
}
</indexingTerms>

{

<fileCount>
{
count($ead//c02[@level="file"]) + count($ead//c03[@level="file"])
}
</fileCount>

}




</findingAid>

}


</findingAids>