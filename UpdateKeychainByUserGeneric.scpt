FasdUAS 1.101.10   ��   ��    k             l     ��  ��    , & Keychain Stale Account Cleanup Script     � 	 	 L   K e y c h a i n   S t a l e   A c c o u n t   C l e a n u p   S c r i p t   
  
 l     ��  ��    8 2 Removes all Keychain entries of specific username     �   d   R e m o v e s   a l l   K e y c h a i n   e n t r i e s   o f   s p e c i f i c   u s e r n a m e      l     ��  ��    Q K Adds back in new items for various organizational email/web/wifi networks      �   �   A d d s   b a c k   i n   n e w   i t e m s   f o r   v a r i o u s   o r g a n i z a t i o n a l   e m a i l / w e b / w i f i   n e t w o r k s        l     ��  ��    J D Based on larger organizations with multiple Exchange/Jabber servers     �   �   B a s e d   o n   l a r g e r   o r g a n i z a t i o n s   w i t h   m u l t i p l e   E x c h a n g e / J a b b e r   s e r v e r s      l     ��  ��    G A Remove enumerated website/im/email servers to trim to your needs     �   �   R e m o v e   e n u m e r a t e d   w e b s i t e / i m / e m a i l   s e r v e r s   t o   t r i m   t o   y o u r   n e e d s      l     ��   !��       Cliff Hirtle    ! � " "    C l i f f   H i r t l e   # $ # l     �� % &��   % O I inspired by Keychain Scripting from Daniel Jalkut of RedSweater Software    & � ' ' �   i n s p i r e d   b y   K e y c h a i n   S c r i p t i n g   f r o m   D a n i e l   J a l k u t   o f   R e d S w e a t e r   S o f t w a r e $  ( ) ( l     �� * +��   * N H http://www.red-sweater.com/blog/2035/usable-keychain-scripting-for-lion    + � , , �   h t t p : / / w w w . r e d - s w e a t e r . c o m / b l o g / 2 0 3 5 / u s a b l e - k e y c h a i n - s c r i p t i n g - f o r - l i o n )  - . - l     �� / 0��   /   created 12/14/12    0 � 1 1 "   c r e a t e d   1 2 / 1 4 / 1 2 .  2 3 2 l     �� 4 5��   4   updated 6/14/13    5 � 6 6     u p d a t e d   6 / 1 4 / 1 3 3  7 8 7 l     ��������  ��  ��   8  9 : 9 l      �� ; <��   ;xr
A little terminological clarification:
What Keychain Access calls a 'Name', the security utility calls a 'label' (-l is match label string)
What Keychain Access calls an 'Account', the security utility calls a 'name' (-a is "match account name string")
What Keychain Access calls 'Where', the security utility calls a 'service name' (-s is "match service name string")
    < � = =� 
 A   l i t t l e   t e r m i n o l o g i c a l   c l a r i f i c a t i o n : 
 W h a t   K e y c h a i n   A c c e s s   c a l l s   a   ' N a m e ' ,   t h e   s e c u r i t y   u t i l i t y   c a l l s   a   ' l a b e l '   ( - l   i s   m a t c h   l a b e l   s t r i n g ) 
 W h a t   K e y c h a i n   A c c e s s   c a l l s   a n   ' A c c o u n t ' ,   t h e   s e c u r i t y   u t i l i t y   c a l l s   a   ' n a m e '   ( - a   i s   " m a t c h   a c c o u n t   n a m e   s t r i n g " ) 
 W h a t   K e y c h a i n   A c c e s s   c a l l s   ' W h e r e ' ,   t h e   s e c u r i t y   u t i l i t y   c a l l s   a   ' s e r v i c e   n a m e '   ( - s   i s   " m a t c h   s e r v i c e   n a m e   s t r i n g " ) 
 :  > ? > l     ��������  ��  ��   ?  @ A @ l     �� B C��   B / ) REVIEW ACTIONS ASK FOR USER CONFIRMATION    C � D D R   R E V I E W   A C T I O N S   A S K   F O R   U S E R   C O N F I R M A T I O N A  E F E l     G���� G I    �� H I
�� .sysodlogaskr        TEXT H m      J J � K K� U s e   t h i s   s c r i p t   a f t e r   m a k i n g   a   c h a n g e   t o   y o u r   n e t w o r k   p a s s w o r d .   T h i s   s c r i p t   f i n d s   a n y   l o c a l l y - s t o r e d   p a s s w o r d   i t e m s   a s s o c i a t e d   w i t h   y o u r   A c t i v e   D i r e c t o r y   u s e r n a m e   ( i e :   a s m i t h ) ,   d e l e t e s   t h e m ,   a n d   r e c r e a t e s   n e w   e n t r i e s   f o r   t h e   f o l l o w i n g   c o m m o n   c o m p a n y   s e r v i c e s :   
 
 -   E n t e r 
 -   Y o u r 
 -   S e r v i c e s 
 -   H e r e 
 
 N o t e :   a n y   o t h e r   l o c a l l y   s a v e d /   p a s s w o r d s   f o r   s e r v e r s / c o n n e c t i o n s / s e r v i c e s   w i t h   t h e   s a m e   u s e r n a m e   W I L L   B E   D E L E T E D . 
 
 W o u l d   y o u   s t i l l   l i k e   t o   p r o c e e d   ( t h i s   w i l l   a l s o   q u i t   M S   O u t l o o k ) ? I �� L M
�� 
btns L J     N N  O P O m     Q Q � R R  C a n c e l P  S�� S m     T T � U U  P r o c e e d��   M �� V W
�� 
dflt V m     X X � Y Y  C a n c e l W �� Z��
�� 
disp Z m   	 
��
�� stic    ��  ��  ��   F  [ \ [ l     ��������  ��  ��   \  ] ^ ] l     �� _ `��   _ B < QUIT OUTLOOK / APPLE MAIL TO ENSURE NO ACTIVITY INTERRUPTED    ` � a a x   Q U I T   O U T L O O K   /   A P P L E   M A I L   T O   E N S U R E   N O   A C T I V I T Y   I N T E R R U P T E D ^  b c b l    d���� d O     e f e I   ������
�� .aevtquitnull��� ��� null��  ��   f m     g g                                                                                  OPIM  alis    �  Macintosh HD               ̜CEH+   �BMicrosoft Outlook.app                                           �p�̼�0        ����  	                Microsoft Office 2011     ̜{�      ̽"�     �B   M  GMacintosh HD:Applications: Microsoft Office 2011: Microsoft Outlook.app   ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  8Applications/Microsoft Office 2011/Microsoft Outlook.app  / ��  ��  ��   c  h i h l     ��������  ��  ��   i  j k j l   $ l���� l O    $ m n m I   #������
�� .aevtquitnull��� ��� null��  ��   n m     o o�                                                                                  emal  alis    F  Macintosh HD               ̜CEH+     MMail.app                                                        Z��pB:        ����  	                Applications    ̜{�      �pzz       M  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��  ��   k  p q p l     ��������  ��  ��   q  r s r l     �� t u��   t !  ASK USER FOR USERNAME/PASS    u � v v 6   A S K   U S E R   F O R   U S E R N A M E / P A S S s  w x w l  % = y z { y r   % = | } | n   % 9 ~  ~ 1   5 9��
�� 
bhit  l  % 5 ����� � I  % 5�� � �
�� .sysodlogaskr        TEXT � m   % & � � � � � � P r o d u c t i o n   o r   P r e - P r o d u c t i o n   m a i l   s e r v e r ?   ( i f   y o u   d o n ' t   k n o w   u s e   P r o d u c t i o n ) � �� � �
�� 
btns � J   ' + � �  � � � m   ' ( � � � � �  P r e - P r o d u c t i o n �  ��� � m   ( ) � � � � �  P r o d u c t i o n��   � �� ���
�� 
dflt � m   , / � � � � �  P r o d u c t i o n��  ��  ��   } o      ���� 0 
mailserver 
MailServer z  n    { � � �  n x  � � � l  > S � � � � r   > S � � � n   > O � � � 1   K O��
�� 
ttxt � l  > K ����� � I  > K�� � �
�� .sysodlogaskr        TEXT � m   > A � � � � � N W h a t   i s   y o u r   A c t i v e   D i r e c t o r y   u s e r n a m e ? � �� ���
�� 
dtxt � m   D G � � � � � ( F i r s t I n i t i a l L a s t N a m e��  ��  ��   � o      ���� 0 acctname AcctName �   n    � � � �    n �  � � � l  T o � � � � r   T o � � � n   T k � � � 1   g k��
�� 
ttxt � l  T g ����� � I  T g�� � �
�� .sysodlogaskr        TEXT � m   T W � � � � � V W h a t   i s   y o u r   n e w   A c t i v e   D i r e c t o r y   p a s s w o r d ? � �� � �
�� 
dtxt � m   Z ] � � � � �   � �� ���
�� 
htxt � m   ` a��
�� boovtrue��  ��  ��   � o      ���� 0 acctpass AcctPass �   n    � � � �    n �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   SET SERVER VARIABLES    � � � � *   S E T   S E R V E R   V A R I A B L E S �  � � � l  p w ����� � r   p w � � � m   p s � � � � � & w e b s i t e . c o m p a n y . c o m � o      ���� 0 ws1  ��  ��   �  � � � l  x  ����� � r   x  � � � m   x { � � � � � & w e b s i t e . c o m p a n y . c o m � o      ���� 0 ws2  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � �  w e b s i t e � o      ���� 0 ws3  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � �  i m . c o m p a n y . c o m � o      ���� 0 im1  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � �  i m 2 . c o m p a n y . c o m � o      ���� 0 im2  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � �  i m 3 . c o m p a n y . c o m � o      ���� 0 im3  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � � r c o m . a p p l e . n e t w o r k . e a p . u s e r . i t e m . w l a n . s s i d . Y o u r W I F I N e t w o r k � o      ���� 0 
wifiserver  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � �  c o m p a n y . c o m � o      ���� 0 
maindomain 
mainDomain��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � �   m a i l . c o m p a n y . c o m � o      ����  0 mailserverprod MailServerProd��  ��   �  �  � l  � ����� r   � � m   � � � & m a i l - p p . c o m p a n y . c o m o      ���� &0 mailserverpreprod MailServerPreProd��  ��     l  � ����� r   � �	
	 b   � � b   � � o   � ����� 0 acctname AcctName m   � � �  @ o   � �����  0 mailserverprod MailServerProd
 o      ���� *0 mailserverprodemail MailServerProdEmail��  ��    l  � ����� r   � � b   � � b   � � o   � ����� 0 acctname AcctName m   � � �  @ o   � ����� &0 mailserverpreprod MailServerPreProd o      ���� 00 mailserverpreprodemail MailServerPreProdEmail��  ��    l  � ����� r   � �  b   � �!"! m   � �## �$$  h t t p s : / /" o   � �����  0 mailserverprod MailServerProd  o      ���� (0 mailserverprodhtps MailServerProdHTPS��  ��   %&% l  � �'����' r   � �()( b   � �*+* m   � �,, �--  h t t p s : / /+ o   � ����� &0 mailserverpreprod MailServerPreProd) o      ���� .0 mailserverpreprodhtps MailServerPreProdHTPS��  ��  & ./. l  �0����0 r   �121 b   �343 b   � �565 o   � ��� 0 acctname AcctName6 m   � �77 �88  @4 o   ��~�~ 0 
maindomain 
mainDomain2 o      �}�} 0 emailaddress emailAddress��  ��  / 9:9 l ;�|�{; r  <=< m  >> �??  h t p s= o      �z�z 0 protocol  �|  �{  : @A@ l B�y�xB r  CDC m  EE �FF $ / e w s / e x c h a n g e . a s m xD o      �w�w 0 emaildomain emailDomain�y  �x  A GHG l I�v�uI r  JKJ m  LL �MM 4 c o m . a p p l e . a c c o u n t . e x c h a n g eK o      �t�t 0 accounttype accountType�v  �u  H NON l     �s�r�q�s  �r  �q  O PQP l     �pRS�p  R . ( OPEN KEYCHAIN TO WATCH WHAT'S HAPPENING   S �TT P   O P E N   K E Y C H A I N   T O   W A T C H   W H A T ' S   H A P P E N I N GQ UVU l     �oWX�o  W 5 / tell application "Keychain Access" to activate   X �YY ^   t e l l   a p p l i c a t i o n   " K e y c h a i n   A c c e s s "   t o   a c t i v a t eV Z[Z l     �n\]�n  \ 8 2 tell application "AppleScript Editor" to activate   ] �^^ d   t e l l   a p p l i c a t i o n   " A p p l e S c r i p t   E d i t o r "   t o   a c t i v a t e[ _`_ l     �m�l�k�m  �l  �k  ` aba l     �jcd�j  c < 6 DELETE ALL INTERNET PASSWORDS MATCHING GIVEN USERNAME   d �ee l   D E L E T E   A L L   I N T E R N E T   P A S S W O R D S   M A T C H I N G   G I V E N   U S E R N A M Eb fgf l  kh�i�hh Q   kij�gi T  #bkk k  (]ll mnm I (3�fo�e
�f .sysoexecTEXT���     TEXTo b  (/pqp m  (+rr �ss F s e c u r i t y   f i n d - i n t e r n e t - p a s s w o r d   - a  q o  +.�d�d 0 acctname AcctName�e  n tut Z 4Mvw�c�bv > 4;xyx l 47z�a�`z 1  47�_
�_ 
rslt�a  �`  y m  7:{{ �||  w I >I�^}�]
�^ .sysoexecTEXT���     TEXT} b  >E~~ m  >A�� ��� J s e c u r i t y   d e l e t e - i n t e r n e t - p a s s w o r d   - a   o  AD�\�\ 0 acctname AcctName�]  �c  �b  u ��[� Z N]���Z�Y� = NU��� l NQ��X�W� 1  NQ�V
�V 
rslt�X  �W  � m  QT�� ���  �  S  XY�Z  �Y  �[  j R      �U�T�S
�U .ascrerr ****      � ****�T  �S  �g  �i  �h  g ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O���O  � ; 5 DELETE ALL GENERIC PASSWORDS MATCHING GIVEN USERNAME   � ��� j   D E L E T E   A L L   G E N E R I C   P A S S W O R D S   M A T C H I N G   G I V E N   U S E R N A M E� ��� l l���N�M� Q  l����L� T  o��� k  t��� ��� I t�K��J
�K .sysoexecTEXT���     TEXT� b  t{��� m  tw�� ��� D s e c u r i t y   f i n d - g e n e r i c - p a s s w o r d   - a  � o  wz�I�I 0 acctname AcctName�J  � ��� Z �����H�G� > ����� l ����F�E� 1  ���D
�D 
rslt�F  �E  � m  ���� ���  � I ���C��B
�C .sysoexecTEXT���     TEXT� b  ����� m  ���� ��� H s e c u r i t y   d e l e t e - g e n e r i c - p a s s w o r d   - a  � o  ���A�A 0 acctname AcctName�B  �H  �G  � ��@� Z �����?�>� = ����� l ����=�<� 1  ���;
�; 
rslt�=  �<  � m  ���� ���  �  S  ���?  �>  �@  � R      �:�9�8
�: .ascrerr ****      � ****�9  �8  �L  �N  �M  � ��� l     �7�6�5�7  �6  �5  � ��� l     �4���4  � P J DELETE ANY INTERNET PASSWORDS MATCHING USERNAME ON PRODUCTION MAIL SERVER   � ��� �   D E L E T E   A N Y   I N T E R N E T   P A S S W O R D S   M A T C H I N G   U S E R N A M E   O N   P R O D U C T I O N   M A I L   S E R V E R� ��� l ���3�2� Q  ����1� T  ���� k  ���� ��� I ���0��/
�0 .sysoexecTEXT���     TEXT� b  ����� m  ���� ��� D s e c u r i t y   f i n d - g e n e r i c - p a s s w o r d   - a  � o  ���.�. *0 mailserverprodemail MailServerProdEmail�/  � ��� Z �����-�,� > ����� l ����+�*� 1  ���)
�) 
rslt�+  �*  � m  ���� ���  � I ���(��'
�( .sysoexecTEXT���     TEXT� b  ����� m  ���� ��� H s e c u r i t y   d e l e t e - g e n e r i c - p a s s w o r d   - a  � o  ���&�& *0 mailserverprodemail MailServerProdEmail�'  �-  �,  � ��%� Z �����$�#� = ����� l ����"�!� 1  ��� 
�  
rslt�"  �!  � m  ���� ���  �  S  ���$  �#  �%  � R      ���
� .ascrerr ****      � ****�  �  �1  �3  �2  � ��� l     ����  �  �  � ��� l     ����  � T N DELETE ANY INTERNET PASSWORDS MATCHING USERNAME ON PRE-PRODUCTION MAIL SERVER   � ��� �   D E L E T E   A N Y   I N T E R N E T   P A S S W O R D S   M A T C H I N G   U S E R N A M E   O N   P R E - P R O D U C T I O N   M A I L   S E R V E R� ��� l O���� Q  O���� T  F�� k  A�� ��� I ���
� .sysoexecTEXT���     TEXT� b  ��� m  �� ��� D s e c u r i t y   f i n d - g e n e r i c - p a s s w o r d   - a  � o  �� 00 mailserverpreprodemail MailServerPreProdEmail�  � ��� Z 1����� > ��� l ���� 1  �
� 
rslt�  �  � m  �� ���  � I "-���
� .sysoexecTEXT���     TEXT� b  ")� � m  "% � H s e c u r i t y   d e l e t e - g e n e r i c - p a s s w o r d   - a    o  %(�� 00 mailserverpreprodemail MailServerPreProdEmail�  �  �  � �
 Z 2A�	� = 29 l 25�� 1  25�
� 
rslt�  �   m  58		 �

    S  <=�	  �  �
  � R      ���
� .ascrerr ****      � ****�  �  �  �  �  �  l     �� ���  �   ��    l     ����   M G DELETE ANY INTERNET PASSWORDS MATCHING SYSTEM PREFERENCES MAIL SERVERS    � �   D E L E T E   A N Y   I N T E R N E T   P A S S W O R D S   M A T C H I N G   S Y S T E M   P R E F E R E N C E S   M A I L   S E R V E R S  l P����� Q  P��� T  S� k  X�  I Xc����
�� .sysoexecTEXT���     TEXT b  X_ m  X[ � D s e c u r i t y   f i n d - g e n e r i c - p a s s w o r d   - a   o  [^���� 0 emailaddress emailAddress��    !  Z d}"#����" > dk$%$ l dg&����& 1  dg��
�� 
rslt��  ��  % m  gj'' �((  # I ny��)��
�� .sysoexecTEXT���     TEXT) b  nu*+* m  nq,, �-- H s e c u r i t y   d e l e t e - g e n e r i c - p a s s w o r d   - a  + o  qt���� 0 emailaddress emailAddress��  ��  ��  ! .��. Z ~�/0����/ = ~�121 l ~�3����3 1  ~���
�� 
rslt��  ��  2 m  ��44 �55  0  S  ����  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   676 l     ��������  ��  ��  7 898 l     ��:;��  : A ; RE-ADD ALL STANDARD COMPANY SERVERS WITH NEW USERNAME/PASS   ; �<< v   R E - A D D   A L L   S T A N D A R D   C O M P A N Y   S E R V E R S   W I T H   N E W   U S E R N A M E / P A S S9 =>= l ��?����? Q  ��@A��@ I ����B��
�� .sysoexecTEXT���     TEXTB b  ��CDC b  ��EFE b  ��GHG b  ��IJI b  ��KLK b  ��MNM b  ��OPO b  ��QRQ b  ��STS b  ��UVU m  ��WW �XX D s e c u r i t y   a d d - i n t e r n e t - p a s s w o r d   - l  V o  ������ 0 ws1  T m  ��YY �ZZ    - s  R o  ������ 0 ws1  P m  ��[[ �\\    - a  N o  ������ 0 acctname AcctNameL m  ��]] �^^    - w  J o  ������ 0 acctpass AcctPassH m  ��__ �`` $   - r   h t t p   - P   8 0   - d  F o  ������ 0 ws1  D m  ��aa �bb <   - T   ' / A p p l i c a t i o n s / S a f a r i . a p p '��  A R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  > cdc l �e����e Q  �fg��f I �
��h��
�� .sysoexecTEXT���     TEXTh b  �iji b  �klk b  ��mnm b  ��opo b  ��qrq b  ��sts b  ��uvu b  ��wxw b  ��yzy b  ��{|{ m  ��}} �~~ D s e c u r i t y   a d d - i n t e r n e t - p a s s w o r d   - l  | o  ������ 0 ws2  z m  �� ���    - s  x o  ������ 0 ws2  v m  ���� ���    - a  t o  ������ 0 acctname AcctNamer m  ���� ���    - w  p o  ������ 0 acctpass AcctPassn m  ���� ��� $   - r   h t t p   - P   8 0   - d  l o  ����� 0 ws2  j m  �� ��� <   - T   ' / A p p l i c a t i o n s / S a f a r i . a p p '��  g R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  d ��� l O������ Q  O����� I F�����
�� .sysoexecTEXT���     TEXT� b  B��� b  >��� b  :��� b  6��� b  2��� b  .��� b  *��� b  &��� b  "��� b  ��� m  �� ��� D s e c u r i t y   a d d - i n t e r n e t - p a s s w o r d   - l  � o  ���� 0 ws3  � m  !�� ���    - s  � o  "%���� 0 ws3  � m  &)�� ���    - a  � o  *-���� 0 acctname AcctName� m  .1�� ���    - w  � o  25���� 0 acctpass AcctPass� m  69�� ��� $   - r   h t t p   - P   8 0   - d  � o  :=���� 0 ws3  � m  >A�� ��� <   - T   ' / A p p l i c a t i o n s / S a f a r i . a p p '��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  � ��� l P������� Q  P������ I S~�����
�� .sysoexecTEXT���     TEXT� b  Sz��� b  Sv��� b  Sr��� b  Sn��� b  Sj��� b  Sf��� b  Sb��� b  S^��� b  SZ��� m  SV�� ��� B s e c u r i t y   a d d - g e n e r i c - p a s s w o r d   - l  � o  VY���� 0 im1  � m  Z]�� ���    - s  � o  ^a���� 0 im1  � m  be�� ���    - a  � o  fi���� 0 acctname AcctName� m  jm�� ���    - w  � o  nq���� 0 acctpass AcctPass� m  ru�� ��� H   - T   ' / A p p l i c a t i o n s / C i s c o   J a b b e r . a p p '� m  vy�� ���    - U��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  � ��� l �������� Q  ������� I �������
�� .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� B s e c u r i t y   a d d - g e n e r i c - p a s s w o r d   - l  � o  ������ 0 im2  � m  ���� ���    - s  � o  ������ 0 im2  � m  ���� ���    - a  � o  ������ 0 acctname AcctName� m  ���� ���    - w  � o  ������ 0 acctpass AcctPass� m  ���� ��� H   - T   ' / A p p l i c a t i o n s / C i s c o   J a b b e r . a p p '� m  ���� ���    - U��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  � ��� l �������� Q  ������� I �������
�� .sysoexecTEXT���     TEXT� b  ����� b  ��� � b  �� b  �� b  �� b  �� b  ��	
	 b  �� b  �� m  �� � B s e c u r i t y   a d d - g e n e r i c - p a s s w o r d   - l   o  ������ 0 im3   m  �� �    - s  
 o  ������ 0 im3   m  �� �    - a   o  ������ 0 acctname AcctName m  �� �    - w   o  ������ 0 acctpass AcctPass  m  �� � H   - T   ' / A p p l i c a t i o n s / C i s c o   J a b b e r . a p p '� m  �� �    - U��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  �  l �/���� Q  �/�� I �&�� ��
�� .sysoexecTEXT���     TEXT  b  �"!"! b  �#$# b  �%&% b  �'(' b  �)*) b  �+,+ b  �
-.- b  �/0/ b  �121 m  ��33 �44 B s e c u r i t y   a d d - g e n e r i c - p a s s w o r d   - l  2 o  ����� 0 
wifiserver  0 m  55 �66    - s  . o  	���� 0 
wifiserver  , m  
77 �88    - a  * o  ���� 0 acctname AcctName( m  99 �::    - w  & o  ���� 0 acctpass AcctPass$ m  ;; �<< �   - T   ' / S y s t e m / L i b r a r y / S y s t e m C o n f i g u r a t i o n / E A P O L C o n t r o l l e r . b u n d l e / C o n t e n t s / R e s o u r c e s / e a p o l c l i e n t '" m  !== �>>    - U��   R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   ?@? l     ��������  ��  ��  @ ABA l     ��CD��  C ' ! CONFIGURE PRODUCTION MAIL SERVER   D �EE B   C O N F I G U R E   P R O D U C T I O N   M A I L   S E R V E RB FGF l 0EH����H Z  0EIJK��I = 07LML o  03���� 0 
mailserver 
MailServerM m  36NN �OO  P r o d u c t i o nJ k  :�PP QRQ Q  :mST��S I =d��U��
�� .sysoexecTEXT���     TEXTU b  =`VWV b  =\XYX b  =XZ[Z b  =T\]\ b  =P^_^ b  =L`a` b  =Hbcb b  =Dded m  =@ff �gg B s e c u r i t y   a d d - g e n e r i c - p a s s w o r d   - l  e o  @C���� *0 mailserverprodemail MailServerProdEmailc m  DGhh �ii    - s   E x c a h n g ea m  HKjj �kk    - a  _ o  LO�� *0 mailserverprodemail MailServerProdEmail] m  PSll �mm    - w  [ o  TW�~�~ 0 acctpass AcctPassY m  X[nn �oo ~   - T   ' / A p p l i c a t i o n s / M i c r o s o f t   O f f i c e   2 0 1 1 / M i c r o s o f t   O u t l o o k . a p p 'W m  \_pp �qq    - U��  T R      �}�|�{
�} .ascrerr ****      � ****�|  �{  ��  R rsr Q  n�tu�zt I q��yv�x
�y .sysoexecTEXT���     TEXTv b  q�wxw b  q�yzy b  q�{|{ b  q�}~} b  q�� b  q���� b  q���� b  q���� b  q���� b  q���� b  q���� b  q|��� b  qx��� m  qt�� ��� D s e c u r i t y   a d d - i n t e r n e t - p a s s w o r d   - a  � o  tw�w�w 0 acctname AcctName� m  x{�� ���    - d  � o  |�v�v 0 emaildomain emailDomain� m  ���� ���    - j   d e f a u l t   - l  � o  ���u�u (0 mailserverprodhtps MailServerProdHTPS� m  ���� ���    - r  � o  ���t�t 0 protocol  � m  ���� ���    - s  � o  ���s�s (0 mailserverprodhtps MailServerProdHTPS~ m  ���� ���    - w  | o  ���r�r 0 acctpass AcctPassz m  ���� ��� <   - T   ' g r o u p : / / I n t e r n e t A c c o u n t s 'x m  ���� ���    - U�x  u R      �q�p�o
�q .ascrerr ****      � ****�p  �o  �z  s ��� l ���n�m�l�n  �m  �l  � ��k� l ���j���j  � + % CONFIGURE PRE-PRODUCTION MAIL SERVER   � ��� J   C O N F I G U R E   P R E - P R O D U C T I O N   M A I L   S E R V E R�k  K ��� = ����� o  ���i�i 0 
mailserver 
MailServer� m  ���� ���  P r e - P r o d u c t i o n� ��h� k  �A�� ��� Q  �����g� I ���f��e
�f .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� B s e c u r i t y   a d d - g e n e r i c - p a s s w o r d   - l  � o  ���d�d 00 mailserverpreprodemail MailServerPreProdEmail� m  ���� ���    - s   E x c h a n g e� m  ���� ���    - a  � o  ���c�c 00 mailserverpreprodemail MailServerPreProdEmail� m  ���� ���    - w  � o  ���b�b 0 acctpass AcctPass� m  ���� ��� ~   - T   ' / A p p l i c a t i o n s / M i c r o s o f t   O f f i c e   2 0 1 1 / M i c r o s o f t   O u t l o o k . a p p '� m  ���� ���    - U�e  � R      �a�`�_
�a .ascrerr ****      � ****�`  �_  �g  � ��� Q  �?���^� I �6�]��\
�] .sysoexecTEXT���     TEXT� b  �2��� b  �.��� b  �*��� b  �&��� b  �"��� b  ���� b  ���� b  ���� b  ���� b  ���� b  �
��� b  ���� b  ���� m  ���� ��� D s e c u r i t y   a d d - i n t e r n e t - p a s s w o r d   - a  � o  ��[�[ 0 acctname AcctName� m  �� ���    - d  � o  	�Z�Z 0 emaildomain emailDomain� m  
�� ���    - j   d e f a u l t   - l  � o  �Y�Y &0 mailserverpreprod MailServerPreProd� m  �� ���    - r  � o  �X�X 0 protocol  � m  �� ���    - s  � o  !�W�W &0 mailserverpreprod MailServerPreProd� m  "%�� ���    - w  � o  &)�V�V 0 acctpass AcctPass� m  *-�� ��� <   - T   ' g r o u p : / / I n t e r n e t A c c o u n t s '� m  .1�� ���    - U�\  � R      �U�T�S
�U .ascrerr ****      � ****�T  �S  �^  � ��R� l @@�Q�P�O�Q  �P  �O  �R  �h  ��  ��  ��  G    l     �N�M�L�N  �M  �L    l     �K�K   H B ENSURE SYSTEM PREFERENCES HAS ACCESS TO EMAIL ACCOUNT CREDENTIALS    � �   E N S U R E   S Y S T E M   P R E F E R E N C E S   H A S   A C C E S S   T O   E M A I L   A C C O U N T   C R E D E N T I A L S  l F}	�J�I	 Q  F}
�H
 I It�G�F
�G .sysoexecTEXT���     TEXT b  Ip b  Il b  Ih b  Id b  I` b  I\ b  IX b  IT b  IP m  IL �   B s e c u r i t y   a d d - g e n e r i c - p a s s w o r d   - a   o  LO�E�E 0 emailaddress emailAddress m  PS!! �""    - l   o  TW�D�D 0 accounttype accountType m  X[## �$$    - s   o  \_�C�C 0 accounttype accountType m  `c%% �&&    - w   o  dg�B�B 0 acctpass AcctPass m  hk'' �(( T   - T   ' / A p p l i c a t i o n s / S y s t e m   P r e f e r e n c e s . a p p ' m  lo)) �**    - U�F   R      �A�@�?
�A .ascrerr ****      � ****�@  �?  �H  �J  �I   +,+ l     �>�=�<�>  �=  �<  , -.- l     �;/0�;  / q k GIVE THE USER HEADS-UP THAT IS ALL GOOD IN THE WORLD OF KEYCHAINESS THEN OPEN APPLICATIONS FOLDER TO PROVE   0 �11 �   G I V E   T H E   U S E R   H E A D S - U P   T H A T   I S   A L L   G O O D   I N   T H E   W O R L D   O F   K E Y C H A I N E S S   T H E N   O P E N   A P P L I C A T I O N S   F O L D E R   T O   P R O V E. 2�:2 l ~�3�9�83 O  ~�454 k  ��66 787 I ���7�6�5
�7 .miscactvnull��� ��� obj �6  �5  8 9:9 I ���4;<
�4 .sysodlogaskr        TEXT; m  ��== �>> Y o u r   K e y c h a i n   i t e m s   h a v e   b e e n   r e s e t .   O p e n   o r   q u i t   +   r e l a u n c h   y o u r   a p p l i c a t i o n s   a n d   v e r i f y   y o u   a r e   a b l e   t o   a c c e s s   t h e m   w i t h o u t   r e a u t h e n t i c a t i n g .< �3?@
�3 
disp? m  ���2
�2 stic   @ �1AB
�1 
btnsA J  ��CC D�0D m  ��EE �FF  O k a y�0  B �/G�.
�/ 
dfltG m  ��HH �II  O k a y�.  : J�-J I ���,K�+
�, .aevtodocnull  �    alisK l ��L�*�)L I ���(M�'
�( .earsffdralis        afdrM m  ���&
�& afdrapps�'  �*  �)  �+  �-  5 m  ~�NN�                                                                                  MACS  alis    t  Macintosh HD               ̜CEH+     0
Finder.app                                                      �k�\s2        ����  	                CoreServices    ̜{�      �\�r       0   *   )  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �9  �8  �:       �%OP�%  O �$
�$ .aevtoappnull  �   � ****P �#Q�"�!RS� 
�# .aevtoappnull  �   � ****Q k    �TT  EUU  bVV  jWW  wXX  �YY  �ZZ  �[[  �\\  �]]  �^^  �__  �``  �aa  �bb  �cc  �dd ee ff gg %hh .ii 9jj @kk Gll fmm �nn �oo �pp qq =rr css �tt �uu �vv �ww xx Fyy zz 2��  �"  �!  R  S � J� Q T� X���� g� o � � � ���� �� ��� � ��� �� �� �� �� �� ��
 ��	 �� �����#�,�7�>� E��L��r����{����������������	',4WY[]_a}����������������������3579;=Nfhjlnp�����������������������!#%')N��=��EH������
� 
btns
� 
dflt
� 
disp
� stic    � 
� .sysodlogaskr        TEXT
� .aevtquitnull��� ��� null� 
� 
bhit� 0 
mailserver 
MailServer
� 
dtxt
� 
ttxt� 0 acctname AcctName
� 
htxt� 0 acctpass AcctPass� 0 ws1  � 0 ws2  � 0 ws3  � 0 im1  � 0 im2  �
 0 im3  �	 0 
wifiserver  � 0 
maindomain 
mainDomain�  0 mailserverprod MailServerProd� &0 mailserverpreprod MailServerPreProd� *0 mailserverprodemail MailServerProdEmail� 00 mailserverpreprodemail MailServerPreProdEmail� (0 mailserverprodhtps MailServerProdHTPS� .0 mailserverpreprodhtps MailServerPreProdHTPS� 0 emailaddress emailAddress�  0 protocol  �� 0 emaildomain emailDomain�� 0 accounttype accountType
�� .sysoexecTEXT���     TEXT
�� 
rslt��  ��  
�� .miscactvnull��� ��� obj 
�� stic   
�� afdrapps
�� .earsffdralis        afdr
�� .aevtodocnull  �    alis� �����lv����� 	O� *j UO� *j UO����lv�a a  	a ,E` Oa a a l 	a ,E` Oa a a a ea  	a ,E` Oa E` Oa E`  Oa !E` "Oa #E` $Oa %E` &Oa 'E` (Oa )E` *Oa +E` ,Oa -E` .Oa /E` 0O_ a 1%_ .%E` 2O_ a 3%_ 0%E` 4Oa 5_ .%E` 6Oa 7_ 0%E` 8O_ a 9%_ ,%E` :Oa ;E` <Oa =E` >Oa ?E` @O D >hZa A_ %j BO_ Ca D a E_ %j BY hO_ Ca F  Y h[OY��W X G HhO D >hZa I_ %j BO_ Ca J a K_ %j BY hO_ Ca L  Y h[OY��W X G HhO D >hZa M_ 2%j BO_ Ca N a O_ 2%j BY hO_ Ca P  Y h[OY��W X G HhO D >hZa Q_ 4%j BO_ Ca R a S_ 4%j BY hO_ Ca T  Y h[OY��W X G HhO D >hZa U_ :%j BO_ Ca V a W_ :%j BY hO_ Ca X  Y h[OY��W X G HhO 4a Y_ %a Z%_ %a [%_ %a \%_ %a ]%_ %a ^%j BW X G HhO 4a __  %a `%_  %a a%_ %a b%_ %a c%_  %a d%j BW X G HhO 4a e_ "%a f%_ "%a g%_ %a h%_ %a i%_ "%a j%j BW X G HhO 0a k_ $%a l%_ $%a m%_ %a n%_ %a o%a p%j BW X G HhO 0a q_ &%a r%_ &%a s%_ %a t%_ %a u%a v%j BW X G HhO 0a w_ (%a x%_ (%a y%_ %a z%_ %a {%a |%j BW X G HhO 0a }_ *%a ~%_ *%a %_ %a �%_ %a �%a �%j BW X G HhO_ a �  � ,a �_ 2%a �%a �%_ 2%a �%_ %a �%a �%j BW X G HhO @a �_ %a �%_ >%a �%_ 6%a �%_ <%a �%_ 6%a �%_ %a �%a �%j BW X G HhOPY �_ a �  � ,a �_ 4%a �%a �%_ 4%a �%_ %a �%a �%j BW X G HhO @a �_ %a �%_ >%a �%_ 0%a �%_ <%a �%_ 0%a �%_ %a �%a �%j BW X G HhOPY hO 0a �_ :%a �%_ @%a �%_ @%a �%_ %a �%a �%j BW X G HhOa � )*j �Oa ��a ��a �kv�a �� 	Oa �j �j �U ascr  ��ޭ