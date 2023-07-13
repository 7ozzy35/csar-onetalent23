REPORT zot_18_p_twitter.

SELECTION-SCREEN BEGIN OF BLOCK log_in WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_id    TYPE char10,
              p_tweet TYPE char10,
              p_at    RADIOBUTTON GROUP g1,
              p_dgstr RADIOBUTTON GROUP g1,
              p_sil   RADIOBUTTON GROUP g1,
              p_gstr  RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK log_in.

START-OF-SELECTION.

  IF p_at = abap_true.
    DATA: lt_zot_18_t_twitter TYPE TABLE OF zot_18_t_twitter.
    APPEND VALUE #( tweet_id = p_id tweet = p_tweet ) TO lt_zot_18_t_twitter.
    MODIFY zot_18_t_twitter FROM TABLE lt_zot_18_t_twitter.
    IF sy-subrc = 0.
      WRITE: / 'Tweet Atıldı'.
    ELSE.
      WRITE: / 'Gönderildi'.
    ENDIF.
  ENDIF.

  IF p_dgstr = abap_true.
  SELECT SINGLE tweet_id, tweet FROM zot_18_t_twitter INTO (@p_id, @p_tweet) WHERE tweet_id = @p_id.
  IF sy-subrc = 0.
    UPDATE zot_18_t_twitter SET tweet = @p_tweet WHERE tweet_id = @p_id.
    COMMIT WORK.
    WRITE: / 'Değiştirildi'.
  ELSE.
    WRITE: / 'Bu id ile gönderi yok'.
  ENDIF.
ENDIF.


  IF p_sil = abap_true.
    SELECT SINGLE tweet_id, tweet FROM zot_18_t_twitter INTO (@p_id, @p_tweet) WHERE tweet_id = @p_id.
    IF sy-subrc = 0.
      DELETE FROM zot_18_t_twitter WHERE tweet_id = @p_id.
      WRITE: / 'Tweeti silindi'.
    ELSE.
      WRITE: / 'Bu id ile gönderi yok'.
    ENDIF.
  ENDIF.

 IF p_gstr = abap_true.
  IF p_id IS INITIAL.
    SELECT tweet_id, tweet FROM zot_18_t_twitter INTO TABLE @DATA(lt_tweets).
    LOOP AT lt_tweets INTO DATA(ls_tweet).
      WRITE: / ls_tweet-tweet_id, ls_tweet-tweet.
    ENDLOOP.
  ELSE.
    DATA(ls_selected_tweet) = VALUE zot_18_t_twitter( tweet_id = p_id ).
    SELECT SINGLE tweet_id, tweet FROM zot_18_t_twitter INTO @ls_selected_tweet WHERE tweet_id = @p_id.
    IF sy-subrc = 0.
      WRITE: / ls_selected_tweet-tweet_id, ls_selected_tweet-tweet.
    ENDIF.
  ENDIF.

  ENDIF.
