{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content no-bottom-line clearfix article-detail equal-heights">
        
          <div class="main">

{{ include file="_tpl/article-cont.tpl" }}

{{ include file="_tpl/article-tools.tpl" }}
            
            </div><!-- / Main -->
            
            <div class="aside">

{{ include file="_tpl/article-aside.tpl" }}
                
                <div class="ad">
                  <!--small>Werbung</small-->
                </div>
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->
    
    <div class="wide-wrapper internal-wrapper">
    
      <div class="content-wrapper">

          <div class="content bottom-line clearfix">

{{ include file="_tpl/article-comments.tpl" }}
                
                <div class="aside">
                
                    <div class="ad">
                        <!--small>Werbung</small-->
                    </div><!-- /.ad -->
                
                </div><!-- /.aside -->
                
            </div><!-- /.content -->

{{ include file="_tpl/article-other-stories.tpl" }} 
        
        </div>
        
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
