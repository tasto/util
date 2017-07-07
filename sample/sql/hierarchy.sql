/* ■できるだけ特定のRDBMSに依存しない階層取得SQL
 withを用いているのでmySqlでは使えないかもしれない。

 以下は部署想定としているが、人とかでも使える。
 テーブルで持つべきは自分のコードと親のコードのみ
 削除フラグは普通入れるよね、ということで代表的なものとして条件に入れている。

 下記を参考させて頂いた
 http://blog.okazuki.jp/entry/20121203/SQLDatabaseRecursive
 
 小文字だと大文字変換の無駄な処理があるから、全部大文字で書け！
 対策で念のため全部大文字。
 実際"そんなことはない"と、いろんなところで実証されているので、
 そこら辺は現場の作法に従うこと。
*/

-- M_DEPARTMENTという部署テーブルがあると想定
-- 以下の項目があるとする
--  CD : 部署コード
--  PARENT_CD : 親の部署コード
--  DELETE_FLAG : 削除フラグ

WITH DEPARTMENT(CD,DEPTH) AS -- コードと深さを設定
(
  SELECT -- ツリーの最上位の取得
    CD,
    1
  FROM M_DEPARTMENT
  WHERE PARENT_CD IS NULL -- 最上位の部署の条件 : ここでは最上位の親はPARENT_CDをnullとしている
  AND DELETE_FLAG = 0 -- 削除されていない
  UNION ALL -- UNION ALLでツリー下位を結合
    SELECT
      D1.CD,
      D2.DEPTH + 1 -- 再帰時に深さを+1にする
    FROM M_DEPARTMENT D1
    JOIN DEPARTMENT D2 ON D2.CD = D1.PARENT_CD -- WITHで指定した一時表と結合させる
    WHERE DELETE_FLAG = 0 -- 削除されていない
)
SELECT 
  D1.CD -- 部署コード
  ,D1.DEPTH -- 深さ
FROM DEPARTMENT D1 
-- 作成したDEPARTMENTと元テーブルのM_DEPARTMENTを結合して、
-- 指定の階層の部署のみ取得、とかいろいろできる。
;
