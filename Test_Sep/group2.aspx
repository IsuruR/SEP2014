<%@ Page Language="C#" AutoEventWireup="true" CodeFile="group2.aspx.cs" Inherits="group2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" type="text/css" href="css/circle-menu.css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
     <script src="jquery.circleMenu.js"></script>
        <script>
            $(function () {
                $('#menu').circleMenu({
                    direction: 'bottom-right',
                    open: function () { console.log('menu opened'); },
                    close: function () { console.log('menu closed'); },
                    init: function () { console.log('menu initialized'); }
                });
                $('#menu2').circleMenu({
                    direction: 'bottom-right',
                    open: function () { console.log('menu opened'); },
                    close: function () { console.log('menu closed'); },
                    init: function () { console.log('menu initialized'); }
                });
                $('#menu3').circleMenu({
                    direction: 'bottom-right',
                    open: function () { console.log('menu opened'); },
                    close: function () { console.log('menu closed'); },
                    init: function () { console.log('menu initialized'); }
                });
                $('#menu4').circleMenu({
                    direction: 'bottom-right',
                    open: function () { console.log('menu opened'); },
                    close: function () { console.log('menu closed'); },
                    init: function () { console.log('menu initialized'); }
                });
                $('#menu5').circleMenu({ direction: 'top-right' });
                $('#menu18').circleMenu({ direction: 'full', trigger: 'hover', step_in: 300, step_out: 300 });
                $('#menu19').circleMenu({ direction: 'full', trigger: 'hover', step_in: 300, step_out: 300 });

                $('#menu10').circleMenu({ direction: 'bottom-half' });
                $('#menu12').circleMenu({ direction: 'right-half' });
                $('#menu11').circleMenu({ direction: 'top-half' });
                $('#menu13').circleMenu({ direction: 'left-half' });
                $('#menu14').circleMenu({ direction: 'full', trigger: 'hover', step_in: 300, step_out: 300 });
                $('#menu17').circleMenu({ direction: 'full', trigger: 'hover', step_in: 300, step_out: 300 });
                $('#menu15').circleMenu({ direction: 'full', trigger: 'click', step_in: -300, step_out: -300 });
                $('#menu16').circleMenu({
                    direction: 'full',
                    step_in: 0,
                    step_out: 0
                });

                $('a').on('click', function (evt) { if ($(this).attr('href') === '#') { evt.preventDefault(); } });

                $('#examples > div:first-child').css('display', 'block');
                $('nav li:first-child a').addClass('active');
                $('nav a').each(function () {
                    var $link = $(this);
                    $link.on('click', function (evt) {
                        $('nav a').removeClass('active');
                        $('#examples > div').css('display', 'none');
                        $('#' + $link.attr('rel')).css('display', 'block');
                        $link.addClass('active');
                    });
                })
            });
        </script>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-27581645-1']);
            _gaq.push(['_trackPageview']);
            (function () {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div >
     <div style="background-image:url(Untitled.jpg);background-size:cover">
            
                <ul class="menu" id="menu17">
                        <li><a href="#"></a></li>
                        <li class="m1L1"><a href="#" alt="Item 1" title="Item 1"><img src="videoPreview_play_icon.png"  id="a1"/></a></li>
                        <li class="m1L2"><a href="#" alt="Item 2" title="Item 2"><img src="videoPreview_play_icon.png"  id="a2"/></a></li>
                        <li class="m1L3"><a href="#" alt="Item 3" title="Item 3"><img src="videoPreview_play_icon.png"  id="a3"/></a></li>
                        <li class="m1L4"><a href="#" alt="Item 4" title="Item 4"><img src="videoPreview_play_icon.png"  id="a4"/></a></li>
                        <li class="m1L5"><a href="#" alt="Item 5" title="Item 5"><img src="videoPreview_play_icon.png"  id="a5"/></a></li>
                        <li class="m1L6"><a href="#" alt="Item 6" title="Item 6"><img src="videoPreview_play_icon.png"  id="a6"/></a></li>
                        <li class="m1L7"><a href="#" alt="Item 7" title="Item 7"><img src="videoPreview_play_icon.png"  id="a7"/></a></li>
                        <li class="m1L8"><a href="#" alt="Item 8" title="Item 8"><img src="videoPreview_play_icon.png"  id="a8"/></a></li>
                    </ul>
            <ul class="menu2" id="menu18">
                        <li><a href="#"></a></li>
                        <li class="m2L1" id="ml1"><a href="#" alt="Item 1" title="Item 1"><img src="videoPreview_play_icon.png"  id="b1"/></a></li>
                        <li class="m2L2"><a href="#" alt="Item 2" title="Item 2"><img src="videoPreview_play_icon.png"  id="b2"/></a></li>
                        <li class="m2L3"><a href="#" alt="Item 3" title="Item 3"><img src="videoPreview_play_icon.png"  id="b3"/></a></li>
                        <li class="m2L4"><a href="#" alt="Item 4" title="Item 4"><img src="videoPreview_play_icon.png"  id="b4"/></a></li>
                        <li class="m2L5"><a href="#" alt="Item 5" title="Item 5"><img src="videoPreview_play_icon.png"  id="b5"/></a></li>
                        <li class="m2L6"><a href="#" alt="Item 6" title="Item 6"><img src="videoPreview_play_icon.png"  id="b6"/></a></li>
                        <li class="m2L7"><a href="#" alt="Item 7" title="Item 7"><img src="videoPreview_play_icon.png"  id="b7"/></a></li>
                        <li class="m2L8"><a href="#" alt="Item 8" title="Item 8"><img src="videoPreview_play_icon.png"  id="b8"/></a></li>
                    </ul>
            <ul class="menu3" id="menu19">
                        <li><a href="#"></a></li>
                        <li class="m3L1"><a href="#" alt="Item 1" title="Item 1"></a></li>
                        <li class="m3L2"><a href="#" alt="Item 2" title="Item 2"></a></li>
                        <li class="m3L3"><a href="#" alt="Item 3" title="Item 3"></a></li>
                        <li class="m3L4"><a href="#" alt="Item 4" title="Item 4"></a></li>
                        <li class="m3L5"><a href="#" alt="Item 5" title="Item 5"></a></li>
                        <li class="m3L6"><a href="#" alt="Item 6" title="Item 6"></a></li>
                        <li class="m3L7"><a href="#" alt="Item 7" title="Item 7"></a></li>
                        <li class="m3L8"><a href="#" alt="Item 8" title="Item 8"></a></li>
                    </ul>
                <ul class="menu4" id="menu14">
                    <li><a href="#"></a></li>
                    <li class="m4L1"><a href="#" alt="Item 1" title="Item 1"></a></li>
                    <li class="m4L2"><a href="#" alt="Item 2" title="Item 2"></a></li>
                    <li class="m4L3"><a href="#" alt="Item 3" title="Item 3"></a></li>
                    <li class="m4L4"><a href="#" alt="Item 4" title="Item 4"></a></li>
                    <li class="m4L5"><a href="#" alt="Item 5" title="Item 5"></a></li>
                    <li class="m4L6"><a href="#" alt="Item 6" title="Item 6"></a></li>
                    <li class="m4L7"><a href="#" alt="Item 7" title="Item 7"></a></li>
                    <li class="m4L8"><a href="#" alt="Item 8" title="Item 8"></a></li>
                </ul>
        </div>
    </div>
      <script type="text/javascript">
          //$("menu").circleMenu.prototype.select( function (evt) {
          //    if (evt = 1)
          //    {
                  
          //    }

          //}
          //);
          $("img").click(function ()
          {
              var id = ($(this).attr('id'));
             if(id='a1')
                window.location.href="storyPage2.aspx";

              

          })

</script>  
    </form>
</body>
</html>
