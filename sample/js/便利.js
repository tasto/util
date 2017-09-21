<script type="text/javascript">
// 増えてきたら用途によってファイルを分ける予定なので、適当なファイル名にしている
    /**
     * Urlパラメーターを取得して連想配列にして返却 ※参考、というかまんま↓
     * http://qiita.com/tonkatu_tanaka/items/99d167ded9330dbc4019
     * @returns {Object}
     */
    function getUrlParameter()
    {
        var arg = new Object;
        var pair=location.search.substring(1).split('&');
        for(var i=0;pair[i];i++) {
            var kv = pair[i].split('=');
            arg[kv[0]]=kv[1];
        }
        return arg;
    }
</script>