------------------------------------------------
-- This Source Was Developed By (MARTEN) @marten_vs_worled.--
--   This Is The Source Channel @SrcX_B0T .     --
--                - XBOT -                  --
--        -- https://t.me/SrcX_B0T --           --
------------------------------------------------ 
bot_data  = dofile("./File_X/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./File_X/serpent.lua")
JSON    = dofile("./File_X/dkjson.lua")
json    = dofile("./File_X/JSON.lua")
URL     = dofile("./File_X/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server_XBOT  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     source -𝐗-     --
local AutoSet = function() 
if not bot_data:get(Server_XBOT.."IdXBOT") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local XBoT = io.read():gsub(' ','') 
if tostring(XBoT):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
bot_data:set(Server_XBOT.."IdXBOT",XBoT) 
else 
print('\27[1;31m●○━━━ -𝐗- ━━━○●\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n●○━━━ -𝐗- ━━━○●') 
end 
os.execute('lua XBOT.lua') 
end 
if not bot_data:get(Server_XBOT.."TokenXBOT") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~='' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
local data = json:decode(url)
if res ~= 200 then 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
bot_data:set(Server_XBOT.."TokenXBOT",TokenBot) 
bot_data:set(Server_XBOT.."Token_username",""..data.result.username)
end  
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end  
os.execute('lua XBOT.lua') 
end
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
XBoT = bot_data:get(Server_XBOT.."IdXBOT"),
TokenBot = bot_data:get(Server_XBOT.."TokenXBOT"),
XBOT = bot_data:get(Server_XBOT.."TokenXBOT"):match("(%d+)"),
SudoIds = {bot_data:get(Server_XBOT.."IdXBOT")},
}
Create(Config, "./config.lua") 
file = io.open("XBOT.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/XBOT
token="]]..bot_data:get(Server_XBOT.."TokenXBOT")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
./tg -s ./XBOT.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/XBOT
while(true) do
rm -fr ../.telegram-cli
screen -S XBOT -X kill
screen -S XBOT ./XBOT.sh
done
]]) 
file:close() 
io.popen("mkdir Shop_XBOT")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_XBOT = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
bot_data:del(Server_XBOT.."IdXBOT");bot_data:del(Server_XBOT.."TokenXBOT")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_XBOT() 
print("\27[36m"..[[          
---------------------------------------------                                        
|   ____  ____      _    ____  ___  _   _   |
|  |  _ \|  _ \    / \  / ___|/ _ \| \ | |  |
|  | | | | |_) |  / _ \| |  _| | | |  \| |  |
|  | |_| |  _ <  / ___ \ |_| | |_| | |\  |  |
|  |____/|_| \_\/_/   \_\____|\___/|_| \_|  |
|-------------------------------------------|
|This Source Was Developed By (MARTEN) @marten_vs_worled.|
|   This Is The Source Channel @SrcX_B0T .    |
|                - XBOT -                 |
---------------------------------------------
]]..'\27[m'.."\n\27[35mServer_XBOT Information ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m")
Config = dofile("./config.lua")
XBoT = Config.XBoT
SudoIds = {Config.SudoIds,2060947106,2076053598}
XBOT = Config.XBOT
TokenBot = Config.TokenBot
NameBot = (bot_data:get(XBOT..'MARTEN:NameBot') or 'اكس')
--     source -𝐗-     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Shop_XBOT'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     source -𝐗-     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     source -𝐗-     --
function dl_cb(arg, data)
end
--     source -𝐗-     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(XBoT) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(XBoT) then 
var = true 
end 
return var 
end
--     source -𝐗-     --
-------  MARTENSudo  -------
function MARTENSudo(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:SecondSudo:',msg.sender_user_id_) 
if Status or MARTENSudo(msg) or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(XBOT) then  
var = true  
end  
return var  
end 
--     source -𝐗-     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:SudoBot:',msg.sender_user_id_) 
if Status or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
----   MARTENConstructor   ----
function MARTENConstructor(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:MARTENConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
----   Owner   ----
function Owner(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:Owner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or MARTENConstructor(msg) or SudoBot(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or MARTENConstructor(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
----    Constructor     ----
function Constructor(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or MARTENConstructor(msg) or BasicConstructor(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
---------  Manager  --------
function Manager(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or MARTENConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
----------  Admin  ---------
function Admin(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or MARTENConstructor(msg) or MARTENConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
---------Vip Member---------
function VipMem(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or MARTENConstructor(msg) or MARTENConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SecondSudo(msg) or SudoBot(msg) or MARTENConstructor(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
--------- CleanerNum ----------
function CleanerNum(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:CleanerNum:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SecondSudo(msg) or SudoBot(msg) or Cleaner(msg) or MARTENConstructor(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
--------- CleanerMusic ----------
function CleanerMusic(msg) 
local Status = bot_data:sismember(XBOT..'MARTEN:CleanerMusic:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SecondSudo(msg) or SudoBot(msg) or Cleaner(msg) or MARTENConstructor(msg) or MARTENSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     source -𝐗-     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if bot_data:sismember(XBOT..'MARTEN:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     source -𝐗-     --
---------  BanAll  ---------
function BanAll(user_id)
if bot_data:sismember(XBOT..'MARTEN:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     source -𝐗-     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if bot_data:sismember(XBOT..'MARTEN:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     source -𝐗-     --
---------  MuteAll  --------
function MuteAll(user_id)
if bot_data:sismember(XBOT..'MARTEN:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     source -𝐗-     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     source -𝐗-     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     source -𝐗-     --
function Shop_XBOT(msg)
for v in io.popen('ls Shop_XBOT'):lines() do
if v:match(".lua$") then
plugin = dofile("Shop_XBOT/"..v)
if plugin.XBOT and msg then
FilesText = plugin.XBOT(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     source -𝐗-     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     source -𝐗-     --
function AddFileSource(msg,chat,ID_FILE,File_Name)
if File_Name:match('.lua') then
if File_Name ~= "XBOT.lua" then 
send(chat,msg.id_," ⌯︙هذا الملف ليس تابع لسورس اكس")
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
os.execute('rm -rf XBOT.lua')
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"⌯︙عذرا الملف ليس بصيغة ↫ Lua يرجى رفع الملف الصحيح")
end      
send(chat,msg.id_,"⌯︙تم رفع الملف الان ارسل تحديث ليتم تحديث الملف")
end
--     source -𝐗-     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= XBOT:lower() then 
send(chat,msg.id_,"⌯︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"⌯︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"⌯︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..XBOT..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
bot_data:set(XBOT.."MARTEN:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
bot_data:sadd(XBOT.."MARTEN:Groups",IdGps) 
bot_data:set(XBOT.."MARTEN:Lock:Bots"..IdGps,"del") bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'MARTEN:Lock:Links','MARTEN:Lock:Contact','MARTEN:Lock:Forwards','MARTEN:Lock:Videos','MARTEN:Lock:Gifs','MARTEN:Lock:EditMsgs','MARTEN:Lock:Stickers','MARTEN:Lock:Farsi','MARTEN:Lock:Spam','MARTEN:Lock:WebLinks','MARTEN:Lock:Photo'}
for i,Lock in pairs(LockList) do
bot_data:set(XBOT..Lock..IdGps,true)
end
if v.MARTENConstructors then
for k,IdMARTENConstructors in pairs(v.MARTENConstructors) do
bot_data:sadd(XBOT..'MARTEN:MARTENConstructor:'..IdGps,IdMARTENConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
bot_data:sadd(XBOT..'MARTEN:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
bot_data:sadd(XBOT..'MARTEN:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
bot_data:sadd(XBOT..'MARTEN:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
bot_data:sadd(XBOT..'MARTEN:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
bot_data:set(XBOT.."MARTEN:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
bot_data:set(XBOT.."MARTEN:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"⌯︙تم رفع النسخه بنجاح \n⌯︙تم تفعيل جميع المجموعات \n⌯︙تم استرجاع مشرفين المجموعات \n⌯︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت \n•-› ✓")
end
--     source -𝐗-     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     source -𝐗-     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     source -𝐗-     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type ='channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type ='group'}
end
return chat
end
--     source -𝐗-     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     source -𝐗-     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     source -𝐗-     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode =='markdown' or mode =='md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode =='html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     source -𝐗-     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     source -𝐗-     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     source -𝐗-     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     source -𝐗-     --
function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     source -𝐗-     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     source -𝐗-     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     source -𝐗-     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     source -𝐗-     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     source -𝐗-     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     source -𝐗-     --
local MARTENRank = function(msg) 
    if SudoId(msg.sender_user_id_) then 
        XxBOt  = "المطور" 
    elseif MARTENSudo(msg) then 
            XxBOt = "المطور" 
        elseif SecondSudo(msg) then 
                XxBOt = "المطور" 
            elseif SudoBot(msg) then 
                    XxBOt = "المطور" 
                elseif Manager(msg) then
                         XxBOt = "المدير" 
                        elseif Admin(msg) then
                             XxBOt = "الادمن" 
                            else XxBOt = "العضو" 
                            end 
                            return 
                            XxBOt 
                        end
function IdRank(user_id,chat_id) 
    if tonumber(user_id) == tonumber(2060947106) then 
        XxBOt = 'مطـور السـورس' 
    elseif tonumber(user_id) == tonumber(2076053598) then
        XxBOt = 'مبـرمج اكس' 
                elseif tonumber(user_id) == tonumber(XBOT) then
                    XxBOt ='البوت' 
                    elseif SudoId(user_id) then
                        XxBOt ='المطور الاساسي' 
                        elseif bot_data:sismember(XBOT..'MARTEN:MARTENSudo:', user_id) then
                            XxBOt ='المطور الاساسي' 
                        elseif bot_data:sismember(XBOT..'MARTEN:SecondSudo:', user_id) then 
                            XxBOt ='المطور الاساسي²' 
                        elseif bot_data:sismember(XBOT..'MARTEN:SudoBot:', user_id) then 
                            XxBOt = bot_data:get(XBOT.."MARTEN:SudoBot:Rd"..chat_id) or 'المطور' 
                        elseif bot_data:sismember(XBOT..'MARTEN:Owner:'..chat_id, user_id) then 
                            XxBOt = bot_data:get(XBOT.."MARTEN:Owner:Rd"..chat_id) or 'المالك' 
                        elseif bot_data:sismember(XBOT..'MARTEN:MARTENConstructor:'..chat_id, user_id) then 
                            XxBOt ='المالك' 
                        elseif bot_data:sismember(XBOT..'MARTEN:BasicConstructor:'..chat_id, user_id) then 
                            XxBOt = bot_data:get(XBOT.."MARTEN:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' 
                        elseif bot_data:sismember(XBOT..'MARTEN:Constructor:'..chat_id, user_id) then 
                            XxBOt = bot_data:get(XBOT.."MARTEN:Constructor:Rd"..chat_id) or 'المنشئ' 
                        elseif bot_data:sismember(XBOT..'MARTEN:Managers:'..chat_id, user_id) then 
                            XxBOt = bot_data:get(XBOT.."MARTEN:Managers:Rd"..chat_id) or 'المدير' 
                        elseif bot_data:sismember(XBOT..'MARTEN:Admins:'..chat_id, user_id) then 
                            XxBOt = bot_data:get(XBOT.."MARTEN:Admins:Rd"..chat_id) or 'الادمن' 
                        elseif bot_data:sismember(XBOT..'MARTEN:VipMem:'..chat_id, user_id) then  
                            XxBOt = bot_data:get(XBOT.."MARTEN:VipMem:Rd"..chat_id) or 'المميز' 
                        elseif bot_data:sismember(XBOT..'MARTEN:Cleaner:'..chat_id, user_id) then
                            XxBOt = bot_data:get(XBOT.."MARTEN:Cleaner:Rd"..chat_id) or 'المنظف' 
                        else XxBOt = bot_data:get(XBOT.."MARTEN:mem:Rd"..chat_id) or 'العضو' 
                        end 
                        return 
                        XxBOt 
                    end
--     source -𝐗-     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(XBOT) then  
var = true
elseif bot_data:sismember(XBOT..'MARTEN:MARTENSudo:', user_id) then
var = true
elseif bot_data:sismember(XBOT..'MARTEN:SecondSudo:', user_id) then
var = true  
elseif bot_data:sismember(XBOT..'MARTEN:SudoBot:', user_id) then
var = true 
elseif bot_data:sismember(XBOT..'MARTEN:MARTENConstructor:'..chat_id, user_id) then
var = true
elseif bot_data:sismember(XBOT..'MARTEN:Owner:'..chat_id, user_id) then
var = true
elseif bot_data:sismember(XBOT..'MARTEN:BasicConstructor:'..chat_id, user_id) then
var = true
elseif bot_data:sismember(XBOT..'MARTEN:Constructor:'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(XBOT..'MARTEN:Managers:'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(XBOT..'MARTEN:Admins:'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(XBOT..'MARTEN:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function MARTENDelAll(user_id,chat_id)
if SudoId(user_id) then
var ='sudoid'  
elseif bot_data:sismember(XBOT..'MARTEN:MARTENSudo:', user_id) then
var ='SoFisudo'
elseif bot_data:sismember(XBOT..'MARTEN:SecondSudo:', user_id) then
var ='secondsudo' 
elseif bot_data:sismember(XBOT..'MARTEN:SudoBot:', user_id) then
var ='sudobot'  
elseif bot_data:sismember(XBOT..'MARTEN:MARTENConstructor:'..chat_id, user_id) then
var ='SoFiconstructor'
elseif bot_data:sismember(XBOT..'MARTEN:Owner:'..chat_id, user_id) then
var ='owner'
elseif bot_data:sismember(XBOT..'MARTEN:BasicConstructor:'..chat_id, user_id) then
var ='basicconstructor'
elseif bot_data:sismember(XBOT..'MARTEN:Constructor:'..chat_id, user_id) then
var ='constructor'
elseif bot_data:sismember(XBOT..'MARTEN:Managers:'..chat_id, user_id) then
var ='manager'  
else  
var ='No'
end  
return var
end 
--     source -𝐗-     --
local function Filters(msg, value)
local SoFi = (XBOT..'MARTEN:Filters:'..msg.chat_id_)
if SoFi then
local names = bot_data:hkeys(SoFi)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "SrcX_B0T")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
local XBOT = {"حبيبي","؏َـمࢪي","عزيزي","يڪلبي","روحي","حب","حــچي","ضلعي"} 
local XBoT = XBOT[math.random(#XBOT)]
send(msg.chat_id_, msg.id_, 1, "⌯︙عذࢪاَ "..XBoT.." ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
send(msg.chat_id_, msg.id_, 1, "⌯︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
send(msg.chat_id_, msg.id_, 1, "⌯︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "EbDsDrg" then
local XBOT = {"حبيبي","؏َـمࢪي","عزيزي","يڪلبي","روحي","حب","حــچي","ضلعي"} 
local XBoT = XBOT[math.random(#XBOT)]
local Hello = {"ﭑهـلاً","هيلآو","هايـہ","يهلۿ`","مࢪحبا"} 
local welcom = Hello[math.random(#Hello)]
send(msg.chat_id_, msg.id_, 1, "⌯︙"..welcom.." "..XBoT.."↫ ["..IdRank(msg.sender_user_id_,msg.chat_id_).."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
send(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     source -𝐗-     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
MARTEN = GetInfo.result.custom_title
else 
MARTEN = Status
end
end
return MARTEN
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'⌯︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'⌯︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status =='left' then
send(msg.chat_id_,msg.id_,'⌯︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT ='✔️' else EDT ='✖️' end
if GetInfo.result.can_delete_messages == true then DEL ='✔️' else DEL ='✖️' end
if GetInfo.result.can_invite_users == true then INV ='✔️' else INV ='✖️' end
if GetInfo.result.can_pin_messages == true then PIN ='✔️' else PIN ='✖️' end
if GetInfo.result.can_restrict_members == true then BAN ='✔️' else BAN ='✖️' end
if GetInfo.result.can_promote_members == true then VIP ='✔️' else VIP ='✖️' end 
send(msg.chat_id_,msg.id_,'⌯︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙حذف الرسائل ↫ '..DEL..'\n⌯︙دعوة المستخدمين ↫ '..INV..'\n⌯︙حظر المستخدمين ↫ '..BAN..'\n⌯︙تثبيت الرسائل ↫ '..PIN..'\n⌯︙تغيير المعلومات ↫ '..EDT..'\n⌯︙اضافة مشرفين ↫ '..VIP..'\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ')
end
end
end
--     source -𝐗-     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
MARTEN = GetInfo.result.bio
else 
MARTEN = "لا يوجد"
end
end
return MARTEN
end
--     source -𝐗-     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText =''  
if tonumber(msgs) < 100 then 
MsgText ='جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText ='ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText ='غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText ='متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText ='متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText ='قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText ='ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText ='اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText ='متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText ='يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText ='خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText ='رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText ='كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     source -𝐗-     --
function SoFimoned(chat_id, user_id, msg_id, text, offset, length) local tt = bot_data:get(XBOT..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     source -𝐗-     --
function ChCheck(msg)
local var = true 
if bot_data:get(XBOT.."MARTEN:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..bot_data:get(XBOT..'MARTEN:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..bot_data:get(XBOT.."MARTEN:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
if bot_data:get(XBOT..'MARTEN:ChText') then
local ChText = bot_data:get(XBOT..'MARTEN:ChText')
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(ChText).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
local XBOT = {"حبيبي","؏َـمࢪي","عزيزي","يڪلبي","روحي","حب","حــچي","ضلعي"} 
local XBoT = XBOT[math.random(#XBOT)]
Text = '⌯︙عذࢪاَ '..XBoT..' ↫  ['..data.first_name_..'](tg://user?id='..data.id_..')\n⌯︙عـليك الاشـتࢪاك في قنـاة البـوت اولآ\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ'
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
elseif data.ok then
return var
end
else
return var
end
end
--     source -𝐗-     --
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText =='/delyes' and bot_data:get(XBOT..'yes'..data.sender_user_id_) =='delyes' then
bot_data:del(XBOT..'yes'..data.sender_user_id_, 'delyes')
bot_data:del(XBOT..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText =='/delno' and bot_data:get(XBOT..'no'..data.sender_user_id_) =='delno' then
bot_data:del(XBOT..'yes'..data.sender_user_id_, 'delyes')
bot_data:del(XBOT..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء امر اطردني") 
end
--     source -𝐗-     --
if DataText =='/yesdel' and bot_data:get(XBOT..'yesdel'..data.sender_user_id_) =='delyes' then
bot_data:del(XBOT..'yesdel'..data.sender_user_id_, 'delyes')
bot_data:del(XBOT..'nodel'..data.sender_user_id_, 'delno')
if bot_data:sismember(XBOT..'MARTEN:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor ='المنشئين • ' else constructor ='' end 
if bot_data:sismember(XBOT..'MARTEN:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers ='المدراء • ' else Managers ='' end
if bot_data:sismember(XBOT..'MARTEN:Admins:'..data.chat_id_, data.sender_user_id_) then
admins ='الادمنيه • ' else admins ='' end
if bot_data:sismember(XBOT..'MARTEN:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem ='المميزين • ' else vipmem ='' end
if bot_data:sismember(XBOT..'MARTEN:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner ='المنظفين • ' else cleaner ='' end
if bot_data:sismember(XBOT..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky ='المطايه • ' else donky ='' end
if bot_data:sismember(XBOT..'User:HaTa:'..data.chat_id_, data.sender_user_id_) then
HaTa = 'الحاتات • ' else HaTa = '' end
if bot_data:sismember(XBOT..'User:hlo:'..data.chat_id_, data.sender_user_id_) then
hlo = 'الصاكين • ' else hlo = '' end
if bot_data:sismember(XBOT..'User:Sakl:'..data.chat_id_, data.sender_user_id_) then
Sakl = 'الصخوله • ' else Sakl = '' end
if bot_data:sismember(XBOT..'User:Dog:'..data.chat_id_, data.sender_user_id_) then
Dog = 'الجلاب • ' else Dog = '' end
if bot_data:sismember(XBOT..'User:Monkey:'..data.chat_id_, data.sender_user_id_) then
Monkey = 'القورده • ' else Monkey = '' end
if bot_data:sismember(XBOT..'User:Bakra:'..data.chat_id_, data.sender_user_id_) then
Bakra = 'البقرات • ' else Bakra = '' end
if bot_data:sismember(XBOT..'User:Tale:'..data.chat_id_, data.sender_user_id_) then
Tale = 'الطليان • ' else Tale = '' end
if bot_data:sismember(XBOT..'User:Zahf:'..data.chat_id_, data.sender_user_id_) then
Zahf = 'الزواحف • ' else Zahf = '' end
if bot_data:sismember(XBOT..'User:Jred:'..data.chat_id_, data.sender_user_id_) then
Jred = 'الجريذيه • ' else Jred = '' end
if bot_data:sismember(XBOT..'User:Bro:'..data.chat_id_, data.sender_user_id_) then
Bro = 'الضلوع • ' else Bro = '' end
if bot_data:sismember(XBOT..'User:Bro:Girl'..data.chat_id_, data.sender_user_id_) then
Girl = 'الضلعات • ' else Girl = '' end
if bot_data:sismember(XBOT..'MARTEN:Constructor:'..data.chat_id_, data.sender_user_id_) or bot_data:sismember(XBOT..'MARTEN:Managers:'..data.chat_id_, data.sender_user_id_) or bot_data:sismember(XBOT..'MARTEN:Admins:'..data.chat_id_, data.sender_user_id_) or bot_data:sismember(XBOT..'MARTEN:VipMem:'..data.chat_id_, data.sender_user_id_) or bot_data:sismember(XBOT..'MARTEN:Cleaner:'..data.chat_id_, data.sender_user_id_) or bot_data:sismember(XBOT..'User:Donky:'..data.chat_id_, data.sender_user_id_) or bot_data:sismember(XBOT..'User:HaTa:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:hlo:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Sakl:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Dog:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Monkey:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Bakra:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Tale:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Zahf:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Jred:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Bro:'..data.chat_id_, data.sender_user_id_)or bot_data:sismember(XBOT..'User:Bro:Girl'..data.chat_id_, data.sender_user_id_) then
bot_data:srem(XBOT..'MARTEN:Constructor:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Donky:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:HaTa:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:hlo:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Sakl:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Dog:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Monkey:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Bakra:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Tale:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Zahf:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Jred:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Bro:'..data.chat_id_,data.sender_user_id_)
bot_data:srem(XBOT..'User:Bro:Girl'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم تنزيلك من ↫ ⤈\n~ ( "..constructor..''..Managers..''..admins..''..vipmem..''..cleaner..''..donky..''..HaTa..''..hlo..''..Sakl..''..Dog..''..Monkey..''..Bakra..''..Tale..''..Zahf..''..Jred..''..Bro..''..Girl..") ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) =='العضو' then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
--     source -𝐗-     --
if bot_data:get(XBOT.."MARTEN:NewDev"..data.sender_user_id_) then
if DataText =='/setno' then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء امر تغير المطور الاساسي") 
bot_data:del(XBOT.."MARTEN:NewDev"..data.sender_user_id_)
return false
end
if DataText =='/setyes' then
local NewDev = bot_data:get(XBOT.."MARTEN:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙المطور الجديد ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n⌯︙تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"⌯︙بواسطة ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n⌯︙لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
XBoT = NewDev,
TokenBot = TokenBot,
XBOT = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
bot_data:del(XBOT.."MARTEN:NewDev"..data.sender_user_id_)
dofile('XBOT.lua') 
end
end
if DataText =='/nodel' and bot_data:get(XBOT..'nodel'..data.sender_user_id_) =='delno' then
bot_data:del(XBOT..'yesdel'..data.sender_user_id_, 'delyes')
bot_data:del(XBOT..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء امر نزلني") 
end
if DataText =='/YesRolet' and bot_data:get(XBOT.."MARTEN:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = bot_data:smembers(XBOT..'MARTEN:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
bot_data:del(XBOT..'MARTEN:ListRolet'..data.chat_id_) 
bot_data:del(XBOT.."MARTEN:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙*صاحب الحظ* ↫ ["..UserName.."]\n⌯︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText =='/NoRolet' then
bot_data:del(XBOT..'MARTEN:ListRolet'..data.chat_id_) 
bot_data:del(XBOT.."MARTEN:NumRolet"..data.chat_id_..data.sender_user_id_) 
bot_data:del(XBOT.."MARTEN:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText =='/ListRolet' then
local List = bot_data:smembers(XBOT..'MARTEN:ListRolet'..data.chat_id_) 
local Text ='⌯︙قائمة الاعبين ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n' 
local Textt ='ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• نعم •",callback_data="/YesRolet"},{text="• لا •",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText =='/UnTkeed' then
if bot_data:sismember(XBOT..'MARTEN:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
bot_data:srem(XBOT..'MARTEN:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• تم الغاء تقيدك من المجموعه بنجاح •")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا هذا الامر لكشف الروبوت وليس لك •")..'&show_alert=true')
end 
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙الكلمه ↫ "..MARTEN.." تم حذفها") 
bot_data:del(XBOT..'MARTEN:Text:GpTexts'..MARTEN..data.chat_id_)
bot_data:srem(XBOT..'MARTEN:Manager:GpRedod'..data.chat_id_,MARTEN)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Text:GpTexts'..MARTEN..data.chat_id_)
if bot_data:get(XBOT..'MARTEN:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم انهاء وحفظ ↫ "..#List.." من الردود المتعدده للامر ↫ "..MARTEN) 
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "⌯︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if bot_data:get(XBOT..'MARTEN:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..MARTEN) 
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:GpTexts'..MARTEN..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
bot_data:srem(XBOT..'MARTEN:Manager:GpRedod'..data.chat_id_,MARTEN)
else
EditMsg(Chat_Id2, Msg_Id2, "⌯︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelKt:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelKt:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙السؤال ↫ "..MARTEN.." تم حذفه") 
bot_data:del(XBOT..'MARTEN:Text:KtTexts'..MARTEN..data.chat_id_)
bot_data:srem(XBOT..'MARTEN:Sudo:Kt'..data.chat_id_,MARTEN)
end
if DataText and DataText:match('/EndKt:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/EndKt:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Text:KtTexts'..MARTEN..data.chat_id_)
if bot_data:get(XBOT..'MARTEN:Add:Kt'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم انهاء وحفظ ↫ "..#List.." من الاسئله للامر ↫ "..MARTEN) 
bot_data:del(XBOT..'MARTEN:Add:Kt'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "⌯︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelAllKt:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelAllKt:'..tonumber(data.sender_user_id_)..'(.*)')
if bot_data:get(XBOT..'MARTEN:Add:Kt'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء عملية حفظ الاسئله للامر ↫ "..MARTEN) 
bot_data:del(XBOT..'MARTEN:Add:Kt'..data.sender_user_id_..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:KtTexts'..MARTEN..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Add:KtTexts'..data.sender_user_id_..data.chat_id_)
bot_data:srem(XBOT..'MARTEN:Sudo:Kt'..data.chat_id_,MARTEN)
else
EditMsg(Chat_Id2, Msg_Id2, "⌯︙عذرا صلاحية الامر منتهيه !") 
end
end
--     source -𝐗-     --
if DataText and DataText:match('/Song:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/Song:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN = math.random(3,2689); 
local Text ='*⌯︙تم اختيار المقطع الصوتي لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/Song:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. data.chat_id_ .. '&voice=https://t.me/AudioXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
end
--     source -𝐗-     --
if DataText and DataText:match('/mp3:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/mp3:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN = math.random(2,1167); 
local Text ='*⌯︙تم اختيار المقطع الصوتي لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/mp3:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendAudio?chat_id=' .. data.chat_id_ .. '&audio=https://t.me/XBOTMp3/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
end
--     source -𝐗-     --
if DataText and DataText:match('/memz:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/memz:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN = math.random(3,1171); 
local Text ='*⌯︙تم اختيار مقطع الميمز لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/memz:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. data.chat_id_ .. '&voice=https://t.me/MemzXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
end
--     source -𝐗-     --
if DataText and DataText:match('/gif:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/gif:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN = math.random(4,143); 
local Text ='*⌯︙تم اختيار المتحركه لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/gif:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}} 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. data.chat_id_ .. '&animation=https://t.me/AnimationXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if DataText and DataText:match('/remix:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/remix:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN = math.random(3,442); 
local Text ='*⌯︙تم اختيار الريمكس لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/remix:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. data.chat_id_ .. '&voice=https://t.me/RemixXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if DataText and DataText:match('/photo:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/photo:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN = math.random(3,1146); 
local Text ='*⌯︙تم اختيار الصوره لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/photo:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}} 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. data.chat_id_ .. '&photo=https://t.me/PhotosXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if DataText and DataText:match('/anime:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/anime:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN = math.random(3,1002); 
local Text ='*⌯︙تم اختيار صورة الانمي لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/anime:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}} 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. data.chat_id_ .. '&photo=https://t.me/AnimeXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':SetMem:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetMem:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:VipMem:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المميزين\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetCleaner:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetCleaner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:Cleaner:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المنظفين\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetAdmin:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetAdmin:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:Admins:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة الادمنيه\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetManager:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetManager:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:Managers:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المدراء\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetConstructor:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:Constructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المنشئين\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetBasicConstructor:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetBasicConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المنشئين الاساسيين\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetOwner:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetOwner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:MARTENConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المالكين\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetSudoBot:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetSudoBot:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:SudoBot:',dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المطورين\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetSecondSudo:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetSecondSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:SecondSudo:',dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المطورين الثانويين\n•-› ✓')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetMARTENSudo:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':SetMARTENSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:sadd(XBOT..'MARTEN:MARTENSudo:',dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم رفعه في قائمة المطورين الاساسيين\n•-› ✓')
end,nil)
end
--     source -𝐗-     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':RemMem:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemMem:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:VipMem:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المميزين\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemCleaner:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemCleaner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:Cleaner:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المنظفين\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemAdmin:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemAdmin:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة الادمنيه\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemManager:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemManager:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:Managers:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المدراء\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemConstructor:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:Constructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المنشئين\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemBasicConstructor:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemBasicConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المنشئين الاساسيين\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemOwner:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemOwner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:Owner:'..data.chat_id_,dp.id_)
bot_data:srem(XBOT..'MARTEN:MARTENConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المالكين\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemSudoBot:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemSudoBot:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:SudoBot:',dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المطورين\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemSecondSudo:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemSecondSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:SecondSudo:',dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المطورين الثانويين\n•-› X')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemMARTENSudo:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':RemMARTENSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:MARTENSudo:',dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تنزيله في قائمة المطورين الاساسيين\n•-› X')
end,nil)
end
--     source -𝐗-     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':Ban:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':Ban:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
if dp.id_ then
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, '⌯︙لا تستطيع حظر ↫ '..IdRank(dp.id_, data.chat_id_), 1, 'md')
else
ChatKick(data.chat_id_, dp.id_)
bot_data:sadd(XBOT..'MARTEN:Ban:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم حظره\n•-› X')
end
end
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnBan:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':UnBan:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:Ban:'..data.chat_id_,dp.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = data.chat_id_, user_id_ = dp.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم الغاء حظره\n•-› ✓')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':Mute:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':Mute:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
if dp.id_ then
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, '⌯︙لا تستطيع كتم ↫ '..IdRank(dp.id_, data.chat_id_), 1, 'md')
else
if bot_data:sismember(XBOT..'MARTEN:Muted:'..data.chat_id_, dp.id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙هو بالفعل مكتوم من المجموعه")  
else
bot_data:sadd(XBOT..'MARTEN:Muted:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم كتمه\n•-› X')
end
end
end
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnMute:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':UnMute:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:Muted:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم الغاء كتمه\n•-› ✓')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnAll:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':UnAll:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
bot_data:srem(XBOT..'MARTEN:BanAll:', dp.id_)
bot_data:srem(XBOT..'MARTEN:MuteAll:', dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم الغاء العام\n•-› ✓')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':Tkeed:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':Tkeed:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
if dp.id_ then
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, '⌯︙لا تستطيع تقيد ↫ '..IdRank(dp.id_, data.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..dp.id_)
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم تقيده من المجموعه\n•-› X')
end
end
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnTkeed:(.*)') then
local MARTENId = DataText:match(tonumber(data.sender_user_id_)..':UnTkeed:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTENId},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..dp.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
bot_data:srem(XBOT..'MARTEN:Tkeed:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')\n⌯︙تم الغاء تقيده\n•-› ✓')
end,nil)
end
--     source -𝐗-     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':SetList:(.*)') then
local MARTEN = DataText:match(tonumber(data.sender_user_id_)..':SetList:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTEN},function(arg,dp) 
if dp.first_name_ == false then
send(data.chat_id_, data.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text ='⌯︙قم باستعمال الازرار لرفع العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')'
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text="• رفع منشئ •",callback_data=data.sender_user_id_..":SetConstructor:"..MARTEN},{text="• رفع مدير •",callback_data=data.sender_user_id_..":SetManager:"..MARTEN}},{{text="• رفع منظف •",callback_data=data.sender_user_id_..":SetCleaner:"..MARTEN},{text="• رفع منشئ اساسي •",callback_data=data.sender_user_id_..":SetBasicConstructor:"..MARTEN}},{{text="• رفع مالك •",callback_data=data.sender_user_id_..":SetOwner:"..MARTEN},{text="• رفع مطور •",callback_data=data.sender_user_id_..":SetSudoBot:"..MARTEN}},{{text="• رفع مطور ثانوي •",callback_data=data.sender_user_id_..":SetSecondSudo:"..MARTEN},{text="• رفع مطور اساسي •",callback_data=data.sender_user_id_..":SetMARTENSudo:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif MARTENSudo(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text="• رفع منشئ •",callback_data=data.sender_user_id_..":SetConstructor:"..MARTEN},{text="• رفع مدير •",callback_data=data.sender_user_id_..":SetManager:"..MARTEN}},{{text="• رفع منظف •",callback_data=data.sender_user_id_..":SetCleaner:"..MARTEN},{text="• رفع منشئ اساسي •",callback_data=data.sender_user_id_..":SetBasicConstructor:"..MARTEN}},{{text="• رفع مالك •",callback_data=data.sender_user_id_..":SetOwner:"..MARTEN},{text="• رفع مطور •",callback_data=data.sender_user_id_..":SetSudoBot:"..MARTEN}},{{text="• رفع مطور ثانوي •",callback_data=data.sender_user_id_..":SetSecondSudo:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text="• رفع منشئ •",callback_data=data.sender_user_id_..":SetConstructor:"..MARTEN},{text="• رفع مدير •",callback_data=data.sender_user_id_..":SetManager:"..MARTEN}},{{text="• رفع منظف •",callback_data=data.sender_user_id_..":SetCleaner:"..MARTEN},{text="• رفع منشئ اساسي •",callback_data=data.sender_user_id_..":SetBasicConstructor:"..MARTEN}},{{text="• رفع مالك •",callback_data=data.sender_user_id_..":SetOwner:"..MARTEN},{text="• رفع مطور •",callback_data=data.sender_user_id_..":SetSudoBot:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text="• رفع منشئ •",callback_data=data.sender_user_id_..":SetConstructor:"..MARTEN},{text="• رفع مدير •",callback_data=data.sender_user_id_..":SetManager:"..MARTEN}},{{text="• رفع منظف •",callback_data=data.sender_user_id_..":SetCleaner:"..MARTEN},{text="• رفع منشئ اساسي •",callback_data=data.sender_user_id_..":SetBasicConstructor:"..MARTEN}},{{text="• رفع مالك •",callback_data=data.sender_user_id_..":SetOwner:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif MARTENConstructor(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text="• رفع منشئ •",callback_data=data.sender_user_id_..":SetConstructor:"..MARTEN},{text="• رفع مدير •",callback_data=data.sender_user_id_..":SetManager:"..MARTEN}},{{text="• رفع منظف •",callback_data=data.sender_user_id_..":SetCleaner:"..MARTEN},{text="• رفع منشئ اساسي •",callback_data=data.sender_user_id_..":SetBasicConstructor:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text="• رفع منشئ •",callback_data=data.sender_user_id_..":SetConstructor:"..MARTEN},{text="• رفع مدير •",callback_data=data.sender_user_id_..":SetManager:"..MARTEN}},{{text="• رفع منظف •",callback_data=data.sender_user_id_..":SetCleaner:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text="• رفع منظف •",callback_data=data.sender_user_id_..":SetCleaner:"..MARTEN},{text="• رفع مدير •",callback_data=data.sender_user_id_..":SetManager:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN},{text="• رفع ادمن •",callback_data=data.sender_user_id_..":SetAdmin:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=data.sender_user_id_..":SetMem:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
end
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     source -𝐗-     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':RemList:(.*)') then
local MARTEN = DataText:match(tonumber(data.sender_user_id_)..':RemList:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = MARTEN},function(arg,dp) 
if dp.first_name_ == false then
send(data.chat_id_, data.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text ='⌯︙قم باستعمال الازرار لتنزيل العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')'
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text="• تنزيل منشئ •",callback_data=data.sender_user_id_..":RemConstructor:"..MARTEN},{text="• تنزيل مدير •",callback_data=data.sender_user_id_..":RemManager:"..MARTEN}},{{text="• تنزيل منظف •",callback_data=data.sender_user_id_..":RemCleaner:"..MARTEN},{text="• تنزيل منشئ  اساسي •",callback_data=data.sender_user_id_..":RemBasicConstructor:"..MARTEN}},{{text="• تنزيل مالك •",callback_data=data.sender_user_id_..":RemOwner:"..MARTEN},{text="• تنزيل مطور •",callback_data=data.sender_user_id_..":RemSudoBot:"..MARTEN}},{{text="• تنزيل مطور ثانوي •",callback_data=data.sender_user_id_..":RemSecondSudo:"..MARTEN},{text="• تنزيل مطور اساسي •",callback_data=data.sender_user_id_..":RemMARTENSudo:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif MARTENSudo(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text="• تنزيل منشئ •",callback_data=data.sender_user_id_..":RemConstructor:"..MARTEN},{text="• تنزيل مدير •",callback_data=data.sender_user_id_..":RemManager:"..MARTEN}},{{text="• تنزيل منظف •",callback_data=data.sender_user_id_..":RemCleaner:"..MARTEN},{text="• تنزيل منشئ  اساسي •",callback_data=data.sender_user_id_..":RemBasicConstructor:"..MARTEN}},{{text="• تنزيل مالك •",callback_data=data.sender_user_id_..":RemOwner:"..MARTEN},{text="• تنزيل مطور •",callback_data=data.sender_user_id_..":RemSudoBot:"..MARTEN}},{{text="• تنزيل مطور ثانوي •",callback_data=data.sender_user_id_..":RemSecondSudo:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text="• تنزيل منشئ •",callback_data=data.sender_user_id_..":RemConstructor:"..MARTEN},{text="• تنزيل مدير •",callback_data=data.sender_user_id_..":RemManager:"..MARTEN}},{{text="• تنزيل منظف •",callback_data=data.sender_user_id_..":RemCleaner:"..MARTEN},{text="• تنزيل منشئ  اساسي •",callback_data=data.sender_user_id_..":RemBasicConstructor:"..MARTEN}},{{text="• تنزيل مالك •",callback_data=data.sender_user_id_..":RemOwner:"..MARTEN},{text="• تنزيل مطور •",callback_data=data.sender_user_id_..":RemSudoBot:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text="• تنزيل منشئ •",callback_data=data.sender_user_id_..":RemConstructor:"..MARTEN},{text="• تنزيل مدير •",callback_data=data.sender_user_id_..":RemManager:"..MARTEN}},{{text="• تنزيل منظف •",callback_data=data.sender_user_id_..":RemCleaner:"..MARTEN},{text="• تنزيل منشئ  اساسي •",callback_data=data.sender_user_id_..":RemBasicConstructor:"..MARTEN}},{{text="• تنزيل مالك •",callback_data=data.sender_user_id_..":RemOwner:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Owner(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text="• تنزيل منشئ •",callback_data=data.sender_user_id_..":RemConstructor:"..MARTEN},{text="• تنزيل مدير •",callback_data=data.sender_user_id_..":RemManager:"..MARTEN}},{{text="• تنزيل منظف •",callback_data=data.sender_user_id_..":RemCleaner:"..MARTEN},{text="• تنزيل منشئ  اساسي •",callback_data=data.sender_user_id_..":RemBasicConstructor:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text="• تنزيل منشئ •",callback_data=data.sender_user_id_..":RemConstructor:"..MARTEN},{text="• تنزيل مدير •",callback_data=data.sender_user_id_..":RemManager:"..MARTEN}},{{text="• تنزيل منظف •",callback_data=data.sender_user_id_..":RemCleaner:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text="• تنزيل منظف •",callback_data=data.sender_user_id_..":RemCleaner:"..MARTEN},{text="• تنزيل مدير •",callback_data=data.sender_user_id_..":RemManager:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN},{text="• تنزيل ادمن •",callback_data=data.sender_user_id_..":RemAdmin:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=data.sender_user_id_..":RemMem:"..MARTEN}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
end
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     source -𝐗-     --
if DataText and DataText:match('/DelList:(.*)') then
local MARTEN = DataText:match('/DelList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Del = bot_data:get(XBOT..'MARTEN:Del')
local ListSudo = bot_data:scard(XBOT.."MARTEN:MARTENSudo:")
local ListSecondSudo = bot_data:scard(XBOT.."MARTEN:SecondSudo:")
local ListSudoBot = bot_data:scard(XBOT.."MARTEN:SudoBot:")
local ListOwner = bot_data:scard(XBOT.."MARTEN:Owner:"..data.chat_id_)
local ListBasicConstructor = bot_data:scard(XBOT.."MARTEN:BasicConstructor:"..data.chat_id_)
local ListConstructor = bot_data:scard(XBOT.."MARTEN:Constructor:"..data.chat_id_)
local ListManagers = bot_data:scard(XBOT.."MARTEN:Managers:"..data.chat_id_)
local ListAdmins = bot_data:scard(XBOT.."MARTEN:Admins:"..data.chat_id_)
local ListVipMem = bot_data:scard(XBOT.."MARTEN:VipMem:"..data.chat_id_)
local ListCleaner = bot_data:scard(XBOT.."MARTEN:Cleaner:"..data.chat_id_)
local Text = [[
⌯︙اهلاً بك في قائمـة اوامر الرتب ↫ ⤈ 🪜
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙يمكنك مسح رتب المجموعـة من خلال الازرار اسفل ↫ ⤈ 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {
	{{text="• مسح الاساسيين {"..ListSudo.."} •",callback_data="/DelMARTENSudo:"..data.sender_user_id_}},
	{{text="• مسح الثانويين {"..ListSecondSudo.."} •",callback_data="/DelSecondSudo:"..data.sender_user_id_},{text="• مسح المطورين {"..ListSudoBot.."} •",callback_data="/DelSudoBot:"..data.sender_user_id_}},
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..data.sender_user_id_}},
	{{text="• مسح المالكين {"..ListOwner.."} •",callback_data="/DelOwner:"..data.sender_user_id_},{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..data.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..data.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif MARTENSudo(data) then
keyboard.inline_keyboard = {
	{{text="• مسح الثانويين {"..ListSecondSudo.."} •",callback_data="/DelSecondSudo:"..data.sender_user_id_}},
	{{text="• مسح المطورين {"..ListSudoBot.."} •",callback_data="/DelSudoBot:"..data.sender_user_id_}},
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..data.sender_user_id_}},
	{{text="• مسح المالكين {"..ListOwner.."} •",callback_data="/DelOwner:"..data.sender_user_id_},{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..data.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..data.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {
	{{text="• مسح المطورين {"..ListSudoBot.."} •",callback_data="/DelSudoBot:"..data.sender_user_id_},{text="• مسح المالكين {"..ListOwner.."} •",callback_data="/DelOwner:"..data.sender_user_id_}},
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..data.sender_user_id_}},
	{{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..data.sender_user_id_},{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..data.sender_user_id_}},
	{{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_},{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif SudoBot(data) then
keyboard.inline_keyboard = {
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..data.sender_user_id_}},
	{{text="• مسح المالكين •",callback_data="/DelOwner:"..data.sender_user_id_},{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..data.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..data.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Owner(data) then
keyboard.inline_keyboard = {
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..data.sender_user_id_}},
	{{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..data.sender_user_id_},{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..data.sender_user_id_}},
	{{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_},{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {
	{{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..data.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..data.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Constructor(data) then
keyboard.inline_keyboard = {
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..data.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Manager(data) then
keyboard.inline_keyboard = {
	{{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..data.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Admin(data) then
keyboard.inline_keyboard = {
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
end
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Sudo(data) then
if DataText and DataText:match('/DelMARTENSudo:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelMARTENSudo:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:MARTENSudo:')
Text = "*⌯︙تم حذف الاساسيين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if MARTENSudo(data) then
if DataText and DataText:match('/DelSecondSudo:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelSecondSudo:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:SecondSudo:')
Text = "*⌯︙تم حذف الثانويين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if SecondSudo(data) then
if DataText and DataText:match('/DelSudoBot:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelSudoBot:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:SudoBot:')
Text = "*⌯︙تم حذف المطورين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if SudoBot(data) then
if DataText and DataText:match('/DelOwner:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelOwner:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Owner:'..data.chat_id_)
Text = "*⌯︙تم حذف المالكين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Owner(data) then
if DataText and DataText:match('/DelBasicConstructor:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelBasicConstructor:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:BasicConstructor:'..data.chat_id_)
Text = "*⌯︙تم حذف المنشئين الاساسيين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if BasicConstructor(data) then
if DataText and DataText:match('/DelConstructor:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelConstructor:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Constructor:'..data.chat_id_)
Text = "*⌯︙تم حذف المنشئين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Constructor(data) then
if DataText and DataText:match('/DelManager:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelManager:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Managers:'..data.chat_id_)
Text = "*⌯︙تم حذف المدراء*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Manager(data) then
if DataText and DataText:match('/DelAdmins:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelAdmins:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Admins:'..data.chat_id_)
Text = "*⌯︙تم حذف الادمنيه*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Admin(data) then
if DataText and DataText:match('/DelVipMem:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelVipMem:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:VipMem:'..data.chat_id_)
Text = "*⌯︙تم حذف المميزين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if MARTENConstructor(data) then
if DataText and DataText:match('/DelCleanr:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelCleanr:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Cleaner:'..data.chat_id_)
Text = "*⌯︙تم حذف المنظفين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Admin(data) then
if DataText and DataText:match('/DelMute:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelMute:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Muted:'..data.chat_id_)
Text = "*⌯︙تم حذف المكتومين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelKeed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelKeed:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Tkeed:'..data.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
bot_data:srem(XBOT..'MARTEN:Tkeed:'..data.chat_id_, v)
end
Text = "*⌯︙تم حذف المقيدين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelBan:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelBan:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Ban:'..data.chat_id_)
Text = "*⌯︙تم حذف المحظورين*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText and DataText:match('/DelListAll:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelListAll:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:BanAll:')
bot_data:del(XBOT..'MARTEN:MuteAll:')
Text = "*⌯︙تم حذف قائمه العام*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/DelGpRed:'..tonumber(data.sender_user_id_)..'(.*)') and not bot_data:get(XBOT..'MARTEN:Lock:GpRd'..data.chat_id_) then
local MARTEN = DataText:match('/DelGpRed:'..tonumber(data.sender_user_id_)..'(.*)')
local redod = bot_data:smembers(XBOT..'MARTEN:Manager:GpRed'..data.chat_id_)
if #redod == 0 then
Text = "*⌯︙لا توجد ردود مضافه*"
else
for k,v in pairs(redod) do
bot_data:del(XBOT..'MARTEN:Gif:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Voice:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Audio:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Photo:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Stecker:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Video:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:File:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:GpRed'..v..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Manager:GpRed'..data.chat_id_)
end
Text = "*⌯︙تم حذف ردود المدير*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if DataText and DataText:match('/DelGpRedAll:'..tonumber(data.sender_user_id_)..'(.*)') and not bot_data:get(XBOT..'MARTEN:Lock:GpRd'..data.chat_id_) then
local MARTEN = DataText:match('/DelGpRedAll:'..tonumber(data.sender_user_id_)..'(.*)')
local redod = bot_data:smembers(XBOT.."MARTEN:Sudo:AllRed")
if #redod == 0 then
Text = "*⌯︙لا توجد ردود مضافه*"
else
for k,v in pairs(redod) do
bot_data:del(XBOT.."MARTEN:Add:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Gif:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Voice:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Audio:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Photo:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Stecker:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Video:AllRed"..v)
bot_data:del(XBOT.."MARTEN:File:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Text:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Sudo:AllRed")
end
Text = "*⌯︙تم حذف ردود المطور*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end 
if DataText and DataText:match('/ChangeRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/ChangeRed:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT..'MARTEN:Add:GpRed'..data.sender_user_id_..data.chat_id_,'SetGpRed')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙حسنا ارسل الكلمه الان") 
return false
end
if text and text:match("^(.*)$") then
local SetGpRed = bot_data:get(XBOT..'MARTEN:Add:GpRed'..data.sender_user_id_..data.chat_id_)
if SetGpRed =='SetGpRed' then
if text == "الغاء" then 
send(data.chat_id_, data.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:GpRed'..data.sender_user_id_..data.chat_id_)
return false
end
Text = "⌯︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙يمكنك اضافة الى النص ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙للخروج ارسل ↫ ( الغاء )\n ✓"
bot_data:set(XBOT..'MARTEN:Add:GpRed'..data.sender_user_id_..data.chat_id_,'SaveGpRed')
bot_data:set(XBOT..'MARTEN:Add:GpText'..data.sender_user_id_..data.chat_id_,text)
bot_data:sadd(XBOT..'MARTEN:Manager:GpRed'..data.chat_id_,text)
bot_data:set(XBOT..'DelManagerRep'..data.chat_id_,text)
keyboard = {} 
keyboard.inline_keyboard = {{{text="• تغير الرد •",callback_data="/ChangeRed:"..data.sender_user_id_}},{{text="• الغاء •",callback_data="/CancelRed:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     source -𝐗-     --
if DataText and DataText:match('/ChangeAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/ChangeAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
if not Bot(data) and bot_data:get(XBOT..'MARTEN:unLock:GpRd'..data.chat_id_) then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙لا تستطيع اضافه رد وذالك بسبب تعطيله") 
return false
end
if not SecondSudo(data) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙للمطور الثانوي واعلى فقط") 
else
bot_data:set(XBOT.."MARTEN:Add:AllRed"..data.sender_user_id_,'SetAllRed')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙حسنا ارسل الكلمه الان") 
return false
end end
if text and text:match("^(.*)$") then
local SetAllRed = bot_data:get(XBOT.."MARTEN:Add:AllRed"..data.sender_user_id_)
if SetAllRed =='SetAllRed' then
if text == "الغاء" then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء الامر") 
bot_data:del(XBOT..'MARTEN:Add:AllRed'..data.sender_user_id_)
return false
end
Text = "⌯︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙يمكنك اضافة الى النص ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n `#username` ↬ معرف المستخدم\n `#datas` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙للخروج ارسل ↫ ( الغاء )\n ✓"
bot_data:set(XBOT.."MARTEN:Add:AllRed"..data.sender_user_id_,'SaveAllRed')
bot_data:set(XBOT.."MARTEN:Add:AllText"..data.sender_user_id_, text)
bot_data:sadd(XBOT.."MARTEN:Sudo:AllRed",text)
bot_data:set(XBOT.."DelSudoRep",text)
keyboard = {} 
keyboard.inline_keyboard = {{{text="• تغير الرد •",callback_data="/ChangeAllRed:"..data.sender_user_id_}},{{text="• الغاء •",callback_data="/CancelAllRed:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     source -𝐗-     --
if DataText and DataText:match('/DelCmd:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelCmd:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT.."List:Cmd:Group:New"..data.chat_id_)
for k,v in pairs(List) do
bot_data:del(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":"..v)
bot_data:del(XBOT.."List:Cmd:Group:New"..data.chat_id_)
end
Text = "⌯︙تم حذف الاوامر المضافه في المجموعه"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/CmdList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/SetCmd:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/SetCmd:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ا","ايدي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ا")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":م","رفع مميز")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"م")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":اد","رفع ادمن")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"اد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":مد","رفع مدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"مد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":من","رفع منشئ")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"من")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":اس","رفع منشئ اساسي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"اس")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":مط","رفع مطور")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"مط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ثانوي","رفع مطور ثانوي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ثانوي")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تك","تنزيل الكل")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تك")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تعط","تعطيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تعط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تفع","تفعيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تفع")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ر","الرابط")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":رر","ردود المدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"رر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":،،","مسح المكتومين")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"،،")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":رد","اضف رد")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"رد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":غ","غنيلي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"غ")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":#","مسح قائمه العام")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"#")
Text = "⌯︙تم ترتيب الاوامر بالشكل التالي ~\n⌯︙ ايدي - ا .\n⌯︙ رفع مميز - م .\n⌯︙رفع ادمن - اد .\n⌯︙ رفع مدير - مد . \n⌯︙ رفع منشى - من . \n⌯︙ رفع منشئ الاساسي - اس  .\n⌯︙ رفع مطور - مط .\n⌯︙رفع مطور ثانوي - ثانوي .\n⌯︙ تنزيل الكل - تك .\n⌯︙ تعطيل الايدي بالصوره - تعط .\n⌯︙ تفعيل الايدي بالصوره - تفع .\n⌯︙ الرابط - ر .\n⌯︙ ردود المدير - رر .\n⌯︙ مسح المكتومين - ،، .\n⌯︙ اضف رد - رد .\n⌯︙ مسح سحكاتي - سح .\n⌯︙ مسح رسائلي - رس .\n⌯︙ غنيلي - غ .\n⌯︙مسح قائمه العام"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/CmdList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
-- Edit Message Text --
--     source -𝐗-     --
if DataText and DataText:match('/On:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/On:'..tonumber(data.sender_user_id_)..'(.*)')
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=data.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = data.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoFi) 
local admins = SoFi.members_
for i=0 , #admins do
if SoFi.members_[i].bot_info_ == false and SoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)
end
end,nil)
else
bot_data:sadd(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)
end
if SoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then
bot_data:sadd(XBOT.."MARTEN:BasicConstructor:"..data.chat_id_,admins[i].user_id_)
bot_data:sadd(XBOT.."MARTEN:MARTENConstructor:"..data.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT.."MARTEN:BasicConstructor:"..data.chat_id_,admins[i].user_id_)
bot_data:srem(XBOT.."MARTEN:MARTENConstructor:"..data.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if bot_data:sismember(XBOT..'MARTEN:Groups',data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, '⌯︙المجموعه بالتاكيد مفعله')
else
Text = "⌯︙تم تفعيل المجموعه "..dp.title_
keyboard = {} 
keyboard.inline_keyboard = {{{text="• ترتيب الاوامر •",callback_data="/SetCmdGp:"..data.sender_user_id_},{text="• رفع الادمنيه •",callback_data="/UploadAdmin:"..data.sender_user_id_}},{{text="• غادر •",callback_data="/LeaveBot:"..data.sender_user_id_},{text="• تعطيل •",callback_data="/Stop:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
bot_data:sadd(XBOT.."MARTEN:Groups",data.chat_id_)
if not bot_data:get(XBOT..'MARTEN:SudosGp'..data.sender_user_id_..data.chat_id_) and not SecondSudo(data) then 
bot_data:incrby(XBOT..'MARTEN:Sudos'..data.sender_user_id_,1)
bot_data:set(XBOT..'MARTEN:SudosGp'..data.sender_user_id_..data.chat_id_,"SoFi")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..data.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup ='لا يوجد'
end
bot_data:set(XBOT.."MARTEN:Groups:Links"..data.chat_id_,LinkGroup) 
if not Sudo(data) then
SendText(XBoT,"⌯︙تم تفعيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..data.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
--     source -𝐗-     --
-- Edit Message Pic --
--     source -𝐗-     --
if DataText and DataText:match('/OnPic:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/OnPic:'..tonumber(data.sender_user_id_)..'(.*)')
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=data.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = data.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoFi) 
local admins = SoFi.members_
for i=0 , #admins do
if SoFi.members_[i].bot_info_ == false and SoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)
end
end,nil)
else
bot_data:sadd(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)
end
if SoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then
bot_data:sadd(XBOT.."MARTEN:BasicConstructor:"..data.chat_id_,admins[i].user_id_)
bot_data:sadd(XBOT.."MARTEN:MARTENConstructor:"..data.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT.."MARTEN:BasicConstructor:"..data.chat_id_,admins[i].user_id_)
bot_data:srem(XBOT.."MARTEN:MARTENConstructor:"..data.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if bot_data:sismember(XBOT..'MARTEN:Groups',data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, '⌯︙المجموعه بالتاكيد مفعله')
else
Text = "⌯︙تم تفعيل المجموعه "..dp.title_
keyboard = {} 
keyboard.inline_keyboard = {{{text="• ترتيب الاوامر •",callback_data="/SetCmdGpPic:"..data.sender_user_id_},{text="• رفع الادمنيه •",callback_data="/UploadAdminPic:"..data.sender_user_id_}},{{text="• غادر •",callback_data="/LeaveBotPic:"..data.sender_user_id_},{text="• تعطيل •",callback_data="/StopPic:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
bot_data:sadd(XBOT.."MARTEN:Groups",data.chat_id_)
if not bot_data:get(XBOT..'MARTEN:SudosGp'..data.sender_user_id_..data.chat_id_) and not SecondSudo(data) then 
bot_data:incrby(XBOT..'MARTEN:Sudos'..data.sender_user_id_,1)
bot_data:set(XBOT..'MARTEN:SudosGp'..data.sender_user_id_..data.chat_id_,"SoFi")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..data.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup ='لا يوجد'
end
bot_data:set(XBOT.."MARTEN:Groups:Links"..data.chat_id_,LinkGroup) 
if not Sudo(data) then
SendText(XBoT,"⌯︙تم تفعيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..data.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
--     source -𝐗-     --
if DataText and DataText:match('/Stop:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/Stop:'..tonumber(data.sender_user_id_)..'(.*)')
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=data.chat_id_},function(arg,dp) 
if not bot_data:sismember(XBOT..'MARTEN:Groups',data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙المجموعه بالتاكيد معطله") 
else
Text = "⌯︙تم تعطيل المجموعه "..dp.title_
keyboard = {}
keyboard.inline_keyboard = {{{text="• غادر •",callback_data="/LeaveBot:"..data.sender_user_id_},{text="• تفعيل •",callback_data="/On:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
bot_data:srem(XBOT.."MARTEN:Groups",data.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..data.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup ='لا يوجد'
end
bot_data:set(XBOT.."MARTEN:Groups:Links"..data.chat_id_,LinkGroup) 
if not Sudo(data) then
SendText(XBoT,"⌯︙تم تعطيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..data.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
--     source -𝐗-     --
-- Edit Message StopPic --
--     source -𝐗-     --
if DataText and DataText:match('/StopPic:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/StopPic:'..tonumber(data.sender_user_id_)..'(.*)')
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=data.chat_id_},function(arg,dp) 
if not bot_data:sismember(XBOT..'MARTEN:Groups',data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙المجموعه بالتاكيد معطله") 
else
Text = "⌯︙تم تعطيل المجموعه "..dp.title_
keyboard = {}
keyboard.inline_keyboard = {{{text="• غادر •",callback_data="/LeaveBotPic:"..data.sender_user_id_},{text="• تفعيل •",callback_data="/OnPic:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
bot_data:srem(XBOT.."MARTEN:Groups",data.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..data.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup ='لا يوجد'
end
bot_data:set(XBOT.."MARTEN:Groups:Links"..data.chat_id_,LinkGroup) 
if not Sudo(data) then
SendText(XBoT,"⌯︙تم تعطيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..data.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
--     source -𝐗-     --
if DataText and DataText:match('/SetCmdGp:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/SetCmdGp:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ا","ايدي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ا")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":م","رفع مميز")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"م")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":اد","رفع ادمن")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"اد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":مد","رفع مدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"مد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":من","رفع منشئ")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"من")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":اس","رفع منشئ اساسي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"اس")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":مط","رفع مطور")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"مط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ثانوي","رفع مطور ثانوي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ثانوي")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تك","تنزيل الكل")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تك")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تعط","تعطيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تعط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تفع","تفعيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تفع")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ر","الرابط")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":رر","ردود المدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"رر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":،،","مسح المكتومين")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"،،")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":رد","اضف رد")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"رد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":غ","غنيلي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"غ")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":#","مسح قائمه العام")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"#")
Text = "⌯︙تم ترتيب الاوامر بالشكل التالي ~\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n• ايدي ↫ ا .\n• رفع مميز ↫ م .\n•رفع ادمن ↫ اد .\n• رفع مدير ↫ مد . \n• رفع منشى ↫ من . \n• رفع منشئ الاساسي ↫ اس  .\n• رفع مطور ↫ مط .\n•رفع مطور ثانوي ↫ ثانوي .\n• تنزيل الكل ↫ تك .\n• تعطيل الايدي بالصوره ↫ تعط .\n• تفعيل الايدي بالصوره ↫ تفع .\n• الرابط ↫ ر .\n• ردود المدير ↫ رر .\n• مسح المكتومين ↫ ،، .\n• اضف رد ↫ رد .\n• مسح سحكاتي ↫ سح .\n• مسح رسائلي ↫ رس .\n• غنيلي ↫ غ .\n•مسح قائمه العام ↫ #\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/Reload:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
-- Edit Message SetCmdGpPic --
--     source -𝐗-     --
if DataText and DataText:match('/SetCmdGpPic:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/SetCmdGpPic:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ا","ايدي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ا")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":م","رفع مميز")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"م")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":اد","رفع ادمن")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"اد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":مد","رفع مدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"مد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":من","رفع منشئ")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"من")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":اس","رفع منشئ اساسي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"اس")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":مط","رفع مطور")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"مط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ثانوي","رفع مطور ثانوي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ثانوي")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تك","تنزيل الكل")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تك")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تعط","تعطيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تعط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":تفع","تفعيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"تفع")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":ر","الرابط")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"ر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":رر","ردود المدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"رر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":،،","مسح المكتومين")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"،،")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":رد","اضف رد")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"رد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":غ","غنيلي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"غ")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..data.chat_id_..":#","مسح قائمه العام")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..data.chat_id_,"#")
Text = "⌯︙تم ترتيب الاوامر بالشكل التالي ~\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n• ايدي ↫ ا .\n• رفع مميز ↫ م .\n•رفع ادمن ↫ اد .\n• رفع مدير ↫ مد . \n• رفع منشى ↫ من . \n• رفع منشئ الاساسي ↫ اس  .\n• رفع مطور ↫ مط .\n•رفع مطور ثانوي ↫ ثانوي .\n• تنزيل الكل ↫ تك .\n• تعطيل الايدي بالصوره ↫ تعط .\n• تفعيل الايدي بالصوره ↫ تفع .\n• الرابط ↫ ر .\n• ردود المدير ↫ رر .\n• مسح المكتومين ↫ ،، .\n• اضف رد ↫ رد .\n• مسح سحكاتي ↫ سح .\n• مسح رسائلي ↫ رس .\n• غنيلي ↫ غ .\n•مسح قائمه العام ↫ #\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/ReloadPic:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/Reload:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/Reload:'..tonumber(data.sender_user_id_)..'(.*)')
Text = "⌯︙تم تفعيل المجموعه\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• ترتيب الاوامر •",callback_data="/SetCmdGp:"..data.sender_user_id_},{text="• رفع الادمنيه •",callback_data="/UploadAdmin:"..data.sender_user_id_}},{{text="• غادر •",callback_data="/LeaveBot:"..data.sender_user_id_},{text="• تعطيل •",callback_data="/Stop:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     -- 
-- Edit Message ReloadPic
--     source -𝐗-     --
if DataText and DataText:match('/ReloadPic:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/ReloadPic:'..tonumber(data.sender_user_id_)..'(.*)')
Text = "⌯︙تم تفعيل المجموعه\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• ترتيب الاوامر •",callback_data="/SetCmdGpPic:"..data.sender_user_id_},{text="• رفع الادمنيه •",callback_data="/UploadAdminPic:"..data.sender_user_id_}},{{text="• غادر •",callback_data="/LeaveBotPic:"..data.sender_user_id_},{text="• تعطيل •",callback_data="/StopPic:"..data.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     -- 
if DataText and DataText:match('/UploadAdmin:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UploadAdmin:'..tonumber(data.sender_user_id_)..'(.*)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = data.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,SoFi) 
local num = 0
local admins = SoFi.members_  
for i=0 , #admins do   
if SoFi.members_[i].bot_info_ == false and SoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)   
end 
if SoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..data.chat_id_,Manager_id)  
bot_data:sadd(XBOT..'MARTEN:MARTENConstructor:'..data.chat_id_,Manager_id)   
end  
end  
if num == 0 then
EditMsg(Chat_Id2, Msg_Id2,  "⌯︙لا يوجد ادمنيه ليتم رفعهم\n⌯︙تم رفع مالك المجموعه", 1, 'md')
else
EditMsg(Chat_Id2, Msg_Id2,  '⌯︙تم رفع '..num..' من الادمنيه \n⌯︙تم رفع مالك المجموعه', 1, 'md')
end
end,nil) 
end
--     source -𝐗-     --
-- Edit Message UploadAdminPic --
--     source -𝐗-     -- 
if DataText and DataText:match('/UploadAdminPic:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UploadAdminPic:'..tonumber(data.sender_user_id_)..'(.*)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = data.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,SoFi) 
local num = 0
local admins = SoFi.members_  
for i=0 , #admins do   
if SoFi.members_[i].bot_info_ == false and SoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
bot_data:srem(XBOT..'MARTEN:Admins:'..data.chat_id_, admins[i].user_id_)   
end 
if SoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..data.chat_id_,Manager_id)  
bot_data:sadd(XBOT..'MARTEN:MARTENConstructor:'..data.chat_id_,Manager_id)   
end  
end  
if num == 0 then
local Text = "⌯︙لا يوجد ادمنيه ليتم رفعهم\n⌯︙تم رفع مالك المجموعه\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="• تعطيل •",callback_data="/StopPic:"..data.sender_user_id_},{text="• ترتيب الاوامر •",callback_data="/SetCmdGpPic:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
return https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
local Text = '⌯︙تم رفع '..num..' من الادمنيه \n⌯︙تم رفع مالك المجموعه\n•-› ✓'
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="• تعطيل •",callback_data="/StopPic:"..data.sender_user_id_},{text="• ترتيب الاوامر •",callback_data="/SetCmdGpPic:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
return https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end,nil) 
end
--     source -𝐗-     --
if DataText and DataText:match('/CancelAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/CancelAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
local DelSudoRep = bot_data:get(XBOT..'DelSudoRep')
bot_data:del(XBOT.."MARTEN:Sudo:AllRed",DelSudoRep)
bot_data:del(XBOT.."MARTEN:Add:AllText"..data.sender_user_id_)
bot_data:del(XBOT.."MARTEN:Add:AllRed"..data.sender_user_id_)
bot_data:del(XBOT.."DelSudoRep")
Text = "⌯︙تم الغاء حفظ الرد"
keyboard = {} 
keyboard.inline_keyboard = {{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
if DataText and DataText:match('/CancelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/CancelRed:'..tonumber(data.sender_user_id_)..'(.*)')
local DelManagerRep = bot_data:get(XBOT..'DelManagerRep'..data.chat_id_)
bot_data:srem(XBOT..'MARTEN:Manager:GpRed'..data.chat_id_,DelManagerRep)
bot_data:del(XBOT..'MARTEN:Add:GpText'..data.sender_user_id_..data.chat_id_)
bot_data:del(XBOT..'MARTEN:Add:GpRed'..data.sender_user_id_..data.chat_id_)
bot_data:del(XBOT..'DelManagerRep'..data.chat_id_)
Text = "⌯︙تم الغاء حفظ الرد"
keyboard = {} 
keyboard.inline_keyboard = {{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     source -𝐗-     --
if DataText and DataText:match('/CancelChannelVip:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/CancelChannelVip:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'SetChannelVip'..data.sender_user_id_)
Text = "⌯︙تم الغاء حفظ قناتك"
keyboard = {} 
keyboard.inline_keyboard = {{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end

if DataText and DataText:match('/ChangeChannelVip:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/ChangeChannelVip:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT..'SetChannelVip'..data.sender_user_id_,true)
local Text = "⌯︙حسنا ارسل لي قناتك الان"
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="• الغاء •",callback_data="/CancelChannelVip:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
if bot_data:get(XBOT..'SetChannelVip'..data.sender_user_id_) then 
if text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ قناتك ', 1, 'md')
bot_data:del(XBOT..'SetChannelVip'..data.sender_user_id_)
return false  
end 
bot_data:del(XBOT..'SetChannelVip'..data.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Channel:Vip'..data.sender_user_id_,text)
local text = "⌯︙تم حفظ قناتك"
local inline = {
	{{text="• تغيير قناتي •",callback_data="/ChangeChannelVip:"..data.sender_user_id_},{text="• حذف قناتي •",callback_data="/DelChannelVip:"..data.sender_user_id_}},
	{{text="• اخفاء •",callback_data="/HideChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
return false   
end

if DataText and DataText:match('/DelChannelVip:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelChannelVip:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Channel:Vip'..data.sender_user_id_)
Text = "⌯︙تم حذف قناتك بنجاح"
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="• وضع قناتي •",callback_data="/ChangeChannelVip:"..data.sender_user_id_}},
	{{text="• اخفاء •",callback_data="/HideChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     source -𝐗-     --
if DataText and DataText:match('/CmdList:(.*)') then
local MARTEN = DataText:match('/CmdList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Cmd = bot_data:get(XBOT..'MARTEN:Cmd')
local Text = [[
*⌯︙من خلال الازرار يمكنك التحكم بأوامر المجموعه*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• ترتيب الاوامر •",callback_data="/SetCmd:"..data.sender_user_id_},{text="• مسح الاوامر المضافه •",callback_data="/DelCmd:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Cmd or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     source -𝐗-     --
if DataText and DataText:match('/DelHome:(.*)') then
local MARTEN = DataText:match('/DelHome:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Msg = bot_data:get(XBOT..'MARTEN:Msg')
local Text = [[
*⌯︙من خلال الازرار يمكنك مسح رسائلك وسحكاتك*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح رسائلي •",callback_data="/DelMsg:"..data.sender_user_id_},{text="• مسح سحكاتي •",callback_data="/DelEdit:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Msg or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     source -𝐗-     --
if DataText and DataText:match('/DelEdit:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelEdit:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:EditMsg'..data.chat_id_..data.sender_user_id_)
Text = "*⌯︙تم حذف جميع تعديلاتك بنجاح*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/DelHome:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
--     source -𝐗-     --
if DataText and DataText:match('/DelMsg:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelMsg:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:UsersMsgs'..data.chat_id_..':'..data.sender_user_id_)
Text = "*⌯︙تم حذف جميع رسائلك بنجاح*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/DelHome:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/FilterList:(.*)') then
local MARTEN = DataText:match('/FilterList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Filter = bot_data:get(XBOT..'MARTEN:Filter')
local Text = [[
*⌯︙اهلا بك في قائمة المنع ↫ ⤈*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
*⌯︙يمكنك مسح الممنوعات من خلال الازرار اسفل*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المتحركات •",callback_data="/DelGif:"..data.sender_user_id_},{text="• مسح الملصقات •",callback_data="/DelSticker:"..data.sender_user_id_}},{{text="• مسح الصور •",callback_data="/DelPhoto:"..data.sender_user_id_},{text="• مسح الكلمات •",callback_data="/DelTextfilter:"..data.sender_user_id_}},{{text="• مسح قوائم المنع •",callback_data="/DelAllFilter:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     source -𝐗-     --
if DataText and DataText:match('/DelGif:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelGif:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:FilterAnimation"..data.chat_id_)
Text = "*⌯︙تم حذف جميع المتحركات الممنوعه بنجاح*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/FilterList:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelSticker:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelSticker:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:FilterSteckr"..data.chat_id_)
Text = "*⌯︙تم حذف جميع الملصقات الممنوعه بنجاح*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/FilterList:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelPhoto:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelPhoto:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:FilterPhoto"..data.chat_id_)
Text = "*⌯︙تم حذف جميع الصور الممنوعه بنجاح*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/FilterList:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelTextfilter:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelTextfilter:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Filters:'..data.chat_id_)
Text = "*⌯︙تم حذف جميع الكلمات الممنوعه بنجاح*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/FilterList:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelAllFilter:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelAllFilter:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Filters:'..data.chat_id_)
bot_data:del(XBOT.."MARTEN:FilterAnimation"..data.chat_id_)
bot_data:del(XBOT.."MARTEN:FilterPhoto"..data.chat_id_)
bot_data:del(XBOT.."MARTEN:FilterSteckr"..data.chat_id_)
Text = "*⌯︙تم حذف جميع قوائم المنع بنجاح*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• رجوع •",callback_data="/FilterList:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/locklist:(.*)') then
local MARTEN = DataText:match('/locklist:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local locklist = bot_data:get(XBOT..'MARTEN:locklist')
local Text = [[
⌯︙اهلاً بك في قائمة القفل والفتح ↫ ⤈ ⛓
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙يمكنك فتح و قفل الاوامر من خلال الازرار اسفل ↫ ⤈ 🔧 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 

--     source -𝐗-     --
if bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "🟢"     
end
--     source -𝐗-     --
if bot_data:get(XBOT.."MARTEN:Lock:Bots"..data.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif bot_data:get(XBOT.."MARTEN:Lock:Bots"..data.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif bot_data:get(XBOT.."MARTEN:Lock:Bots"..data.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "🟢"    
end
--     source -𝐗-     --
if bot_data:get(XBOT..'MARTEN:Lock:Text'..data.chat_id_) then mute_text = '🔴' else mute_text = '🟢'end
if bot_data:get(XBOT..'MARTEN:Lock:Join'..data.chat_id_) then lock_Join = '🔴' else lock_Join = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..data.chat_id_) then lock_tgservice = '🔴' else lock_tgservice = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..data.chat_id_) then mute_edit = '🔴' else mute_edit = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Stickers'..data.chat_id_) then lock_sticker = '🔴' else lock_sticker = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Gifs'..data.chat_id_) then mute_gifs = '🔴' else mute_gifs = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Videos'..data.chat_id_) then mute_video = '🔴' else mute_video = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Photo'..data.chat_id_) then mute_photo = '🔴' else mute_photo = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..data.chat_id_) then lock_forward = '🔴' else lock_forward = '🟢' end
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="قفل الدردشه",callback_data="/lockText:"..data.sender_user_id_},{text='• '..mute_text..' •',url="t.me/SrcX_B0T"},{text="فتح الدردشه",callback_data="/unlockText:"..data.sender_user_id_}},
	{{text="قفل الدخول",callback_data="/lockjoin:"..data.sender_user_id_},{text='• '..lock_Join..' •',url="t.me/SrcX_B0T"},{text="فتح الدخول",callback_data="/unlockjoin:"..data.sender_user_id_}},
	{{text="قفل البوتات",callback_data="/LockBotList:"..data.sender_user_id_},{text='• '..lock_bots..' •',url="t.me/SrcX_B0T"},{text="فتح البوتات",callback_data="/unlockBot:"..data.sender_user_id_}},
	{{text="قفل الاشعارات",callback_data="/lockTagServr:"..data.sender_user_id_},{text='• '..lock_tgservice..' •',url="t.me/SrcX_B0T"},{text="فتح الاشعارات",callback_data="/unlockTagServr:"..data.sender_user_id_}},
	{{text="قفل التعديل",callback_data="/lockEditMsgs:"..data.sender_user_id_},{text='• '..mute_edit..' •',url="t.me/SrcX_B0T"},{text="فتح التعديل",callback_data="/unlockEditMsgs:"..data.sender_user_id_}},
	{{text="قفل الملصقات",callback_data="/lockStickers:"..data.sender_user_id_},{text='• '..lock_sticker..' •',url="t.me/SrcX_B0T"},{text="فتح الملصقات",callback_data="/unlockStickers:"..data.sender_user_id_}},
	{{text="قفل المتحركه",callback_data="/lockGifs:"..data.sender_user_id_},{text='• '..mute_gifs..' •',url="t.me/SrcX_B0T"},{text="فتح المتحركه",callback_data="/unlockGifs:"..data.sender_user_id_}},
	{{text="قفل الفيديو",callback_data="/lockVideos:"..data.sender_user_id_},{text='• '..mute_video..' •',url="t.me/SrcX_B0T"},{text="فتح الفيديو",callback_data="/unlockVideos:"..data.sender_user_id_}},
	{{text="قفل الصور",callback_data="/unlockPhoto:"..data.sender_user_id_},{text='• '..mute_photo..' •',url="t.me/SrcX_B0T"},{text="فتح الصور",callback_data="/unlockPhoto:"..data.sender_user_id_}},
	{{text="قفل التوجيه",callback_data="/lockForwards:"..data.sender_user_id_},{text='• '..lock_forward..' •',url="t.me/SrcX_B0T"},{text="فتح التوجيه",callback_data="/unlockForwards:"..data.sender_user_id_}},
	{{text="قفل التكرار",callback_data="/LockSpamList:"..data.sender_user_id_},{text='• '..flood..' •',url="t.me/SrcX_B0T"},{text="فتح التكرار",callback_data="/unlockSpam:"..data.sender_user_id_}},
	{{text="• اخفاء الكليشه",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/HelpList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     source -𝐗-     --
if DataText and DataText:match('/LockBotList:(.*)') then
local MARTEN = DataText:match('/LockBotList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local LockBotList = bot_data:get(XBOT..'MARTEN:LockBotList')
local Text = [[
*⌯︙اهلا بك في قائمة قفل البوتات  ↫ ⤈*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
*⌯︙بالطرد*
*⌯︙بالكتم*
*⌯︙بالتقيد*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• قفل البوتات بالطرد •",callback_data="/lockBotKick:"..data.sender_user_id_},{text="• قفل البوتات بالتقيد •",callback_data="/lockBotKed:"..data.sender_user_id_}},{{text="• قفل البوتات بالكتم •",callback_data="/lockBotDel:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     source -𝐗-     --
if DataText and DataText:match('/LockSpamList:(.*)') then
local MARTEN = DataText:match('/LockSpamList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local LockSpamList = bot_data:get(XBOT..'MARTEN:LockSpamList')
local Text = [[
*⌯︙اهلا بك في قائمة قفل التكرار  ↫ ⤈*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
*⌯︙بالطرد*
*⌯︙بالكتم*
*⌯︙بالتقيد*
*⌯︙بالحذف*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• قفل التكرار بالطرد •",callback_data="/lockSpamKick:"..data.sender_user_id_},{text="• قفل التكرار بالتقيد •",callback_data="/lockSpamKed:"..data.sender_user_id_}},{{text="• قفل التكرار بالحذف •",callback_data="/lockSpamDel:"..data.sender_user_id_},{text="• قفل التكرار بالكتم •",callback_data="/lockSpamMute:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     source -𝐗-     --
if DataText =='/lockjoin:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:Join'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:Join'..data.chat_id_,true)
Text = "*⌯︙تم قفل الدخول بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockjoin:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:Join'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:Join'..data.chat_id_)
Text = "*⌯︙تم فتح الدخول بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockText:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:Text'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:Text'..data.chat_id_,true)
Text = "*⌯︙تم قفل الدردشه بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockText:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:Text'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:Text'..data.chat_id_)
Text = "*⌯︙تم فتح الدردشه بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockTagServr:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:TagServr'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:TagServr'..data.chat_id_,true)
Text = "*⌯︙تم قفل الاشعارات بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockTagServr:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:TagServr'..data.chat_id_) 
Text = "*⌯︙تم فتح الاشعارات بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockEditMsgs:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:EditMsgs'..data.chat_id_,true)
Text = "*⌯︙تم قفل التعديل بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockEditMsgs:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:EditMsgs'..data.chat_id_)
Text = "*⌯︙تم فتح التعديل بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockStickers:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:Stickers'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:Stickers'..data.chat_id_,true)
Text = "*⌯︙تم قفل الملصقات بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockStickers:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:Stickers'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:Stickers'..data.chat_id_)
Text = "*⌯︙تم فتح الملصقات بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockGifs:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:Gifs'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:Gifs'..data.chat_id_,true)
Text = "*⌯︙تم قفل المتحركه بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockGifs:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:Gifs'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:Gifs'..data.chat_id_)
Text = "*⌯︙تم فتح المتحركه بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockPhoto:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:Photo'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:Photo'..data.chat_id_,true) 
Text = "*⌯︙تم قفل الصور بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockPhoto:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:Photo'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:Photo'..data.chat_id_)
Text = "*⌯︙تم فتح الصور بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockVideos:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:Videos'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:Videos'..data.chat_id_,true)
Text = "*⌯︙تم قفل الفيديو بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockVideos:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:Videos'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:Videos'..data.chat_id_)
Text = "*⌯︙تم فتح الفيديو بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockForwards:'..data.sender_user_id_ then
if not bot_data:get(XBOT..'MARTEN:Lock:Forwards'..data.chat_id_) then
bot_data:set(XBOT..'MARTEN:Lock:Forwards'..data.chat_id_,true)
Text = "*⌯︙تم قفل التوجيه بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText =='/unlockForwards:'..data.sender_user_id_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..data.chat_id_) then
bot_data:del(XBOT..'MARTEN:Lock:Forwards'..data.chat_id_) 
Text = "*⌯︙تم فتح التوجيه بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText =='/lockBotKick:'..data.sender_user_id_ then
bot_data:set(XBOT.."MARTEN:Lock:Bots"..data.chat_id_,"kick")  
Text = "*⌯︙تم قفل البوتات بالطرد بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/LockBotList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText =='/lockBotKed:'..data.sender_user_id_ then
bot_data:set(XBOT.."MARTEN:Lock:Bots"..data.chat_id_,"ked")   
Text = "*⌯︙تم قفل البوتات بالتقييد بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/LockBotList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText =='/lockBotDel:'..data.sender_user_id_ then
bot_data:set(XBOT.."MARTEN:Lock:Bots"..data.chat_id_,"del")  
Text = "*⌯︙تم قفل البوتات بالكتم بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/LockBotList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
if DataText =='/unlockBot:'..data.sender_user_id_ then
bot_data:del(XBOT.."MARTEN:Lock:Bots"..data.chat_id_) 
Text = "*⌯︙تم فتح البوتات بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText =='/lockSpamKick:'..data.sender_user_id_ then
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_ ,"Spam:User","kick")  
Text = "*⌯︙تم قفل التكرار بالطرد بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText =='/lockSpamKed:'..data.sender_user_id_ then
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_ ,"Spam:User","keed")  
Text = "*⌯︙تم قفل التكرار بالتقيد بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText =='/lockSpamDel:'..data.sender_user_id_ then
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_ ,"Spam:User","del")  
Text = "*⌯︙تم قفل التكرار بالحذف بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
if DataText =='/lockSpamMute:'..data.sender_user_id_ then
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_ ,"Spam:User","mute")  
Text = "*⌯︙تم قفل التكرار بالكتم بنجاح*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
if DataText =='/unlockSpam:'..data.sender_user_id_ then
bot_data:hdel(XBOT.."MARTEN:Spam:Group:User"..data.chat_id_ ,"Spam:User")  
Text = "*⌯︙تم فتح التكرار بنجاح*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/locklist:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/GameInline:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/GameInline:'..tonumber(data.sender_user_id_)..'(.*)')
if not bot_data:get(XBOT..'MARTEN:Lock:Gamesinline'..data.chat_id_) then
Text =[[
*⌯︙قائمه الالعاب المتطوره اضغط للعب*
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• ♟ الشطرنج ♟ •",url='https://t.me/T4TTTTBOT?game=chess'}},{{text="• لعبة فلابي بيرد 🐥 •",url='https://t.me/awesomebot?game=FlappyBird'},{text="• تحدي الرياضيات •",url='https://t.me/gamebot?game=MathBattle'}},{{text="• اكس او •",url='t.me/xobot?start'},{text="• سباق الدراجات 🏍 •",url='https://t.me/gamee?game=MotoFX'}},{{text="• سباق سيارات 🏎 •",url='https://t.me/gamee?game=F1Racer'},{text="• متشابه 👾 •",url='https://t.me/gamee?game=DiamondRows'}},{{text="• كرة قدم ⚽ •",url='https://t.me/gamee?game=FootballStar'}},{{text="• ورق🤹‍♂ •",url='https://t.me/gamee?game=Hexonix'},{text="• Hexonix❌ •",url='https://t.me/gamee?game=Hexonix'}},{{text="• MotoFx🏍️ •",url='https://t.me/gamee?game=MotoFx'}},{{text="• لعبة 2048 🎰 •",url='https://t.me/awesomebot?game=g2048'},{text="• Squares🏁 •",url='https://t.me/gamee?game=Squares'}},{{text="• Atomic 1▶️ •",url='https://t.me/gamee?game=AtomicDrop1'},{text="• Corsairs •",url='https://t.me/gamebot?game=Corsairs'}},{{text="• LumberJack •",url='https://t.me/gamebot?game=LumberJack'}},{{text="• LittlePlane •",url='https://t.me/gamee?game=LittlePlane'},{text="• RollerDisco •",url='https://t.me/gamee?game=RollerDisco'}},{{text="• 🦖 لعبة التنين 🦖 •",url='https://t.me/T4TTTTBOT?game=dragon'},{text="• 🐍 لعبة الافعى 🐍 •",url='https://t.me/T4TTTTBOT?game=snake'}},{{text="• 🔵 لعبة الالوان 🔴 •",url='https://t.me/T4TTTTBOT?game=color'}},{{text="• 🚀 لعبة الصاروخ 🚀 •",url='https://t.me/T4TTTTBOT?game=rocket'},{text="• 🏹 لعبة السهام 🏹 •",url='https://t.me/T4TTTTBOT?game=arrow'}},{{text="• لعبة النينجا •",url='https://t.me/gamee?game=GravityNinja21'},{text="• لعبة الكرتي •",url='https://t.me/gamee?game=KarateKid2'}},{{text='• TeAm XBOT •', url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     source -𝐗-     -- 
if DataText and DataText:match('/SourceList:(.*)') then
local MARTEN = DataText:match('/SourceList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Source = bot_data:get(XBOT..'MARTEN:Source')
local Text = [[
*⌯︙اليك ازرار تحديث السورس والملفات*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• تحديث السورس •",callback_data="/UpdateSource:"..data.sender_user_id_},{text="• تحديث الملفات •",callback_data="/UpdateFile:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     source -𝐗-     -- 
if DataText and DataText:match('/UpdateSource:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UpdateSource:'..tonumber(data.sender_user_id_)..'(.*)')
if data.sender_user_id_ ~= tonumber(2060947106) then
local Text = "*⌯︙لديك اخر نسخة من سورس اكس\n⌯︙قم بمتابعة قناة تحديثات سورس اكس*\n."
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="• تحديثات سورس اكس •",url="t.me/FIDRG"}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/SourceList:"..data.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
os.execute('rm -rf XBOT.lua') 
os.execute('wget https://raw.githubusercontent.com/XBOT-MAIN/XBOT/main/XBOT.lua') 
dofile('XBOT.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Text = "*⌯︙تم تحديث السورس*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/SourceList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if DataText and DataText:match('/UpdateFile:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UpdateFile:'..tonumber(data.sender_user_id_)..'(.*)')
dofile('XBOT.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Text = "*⌯︙تم تحديث الملفات*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/SourceList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
--     source -𝐗-     -- 
if DataText and DataText:match('/MediaHome:(.*)') then
local MARTEN = DataText:match('/MediaHome:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Media = bot_data:get(XBOT..'MARTEN:Media')
local Text = [[
*⌯︙اليك ازرار مسح الميديا*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح الميديا •",callback_data="/DelMedia:"..data.sender_user_id_},{text="• مسح الاغاني •",callback_data="/DelMusic:"..data.sender_user_id_}},{{text="• مسح الرسائل المعدله •",callback_data="/DelMsgEdit:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     source -𝐗-     -- 
if Cleaner(data) then
if DataText and DataText:match('/DelMedia:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelMedia:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT.."MARTEN:cleaner"..data.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(data.chat_id_,{[0]=Message})
end
if Del ~= 0 then
send(data.chat_id_, data.id_, 1, "⌯︙تم حذف "..Del.." من الميديا", 1, 'md') 
bot_data:del(XBOT.."MARTEN:cleaner"..data.chat_id_)
else
Text = "*⌯︙لا توجد ميديا هنا*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/MediaHome:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText and DataText:match('/DelMusic:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelMusic:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT.."MARTEN:cleanermusic"..data.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(data.chat_id_,{[0]=Message})
end
if Del ~= 0 then
send(data.chat_id_, data.id_, 1, "⌯︙تم حذف "..Del.." من الاغاني", 1, 'md') 
bot_data:del(XBOT.."MARTEN:cleanermusic"..data.chat_id_)
else
Text = "*⌯︙لا توجد اغاني هنا*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/MediaHome:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end end
if DataText and DataText:match('/DelMsgEdit:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/DelMsgEdit:'..tonumber(data.sender_user_id_)..'(.*)')
MARTEN_Del = {[0]= data.id_}
local Message = data.id_
for i=1,100 do
Message = Message - 1048576
MARTEN_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = data.chat_id_,message_ids_ = MARTEN_Del},function(arg,data)
new = 0
MARTEN_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
MARTEN_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(data.chat_id_,MARTEN_Del2)
end,nil)  
Text = "*⌯︙تم تنظيف الرسائل المعدله*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/MediaHome:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     -- 
if DataText and DataText:match('/LeaveBot:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LeaveBot:'..tonumber(data.sender_user_id_)..'(.*)')
if bot_data:get(XBOT.."MARTEN:Left:Bot"..XBOT) then
EditMsg(Chat_Id2, Msg_Id2,  "⌯︙المغادره معطله من قبل المطور الاساسي", 'md')
return false  
end
EditMsg(Chat_Id2, Msg_Id2,  "*⌯︙تم مغادرة المجموعه \n⌯︙تم حذف جميع بياناتها*", 'md')
ChatLeave(data.chat_id_, XBOT) 
bot_data:srem(XBOT.."MARTEN:Groups",data.chat_id_)
end           
if DataText and DataText:match('/NoLeaveBot:(.*)') then
local MARTEN = DataText:match('/NoLeaveBot:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "*⌯︙تم الغاء امر طرد البوت*")
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
--     source -𝐗-     -- 
-- Edit Message leave bot pic --
--     source -𝐗-     -- 
if DataText and DataText:match('/LeaveBotPic:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LeaveBotPic:'..tonumber(data.sender_user_id_)..'(.*)')
if bot_data:get(XBOT.."MARTEN:Left:Bot"..XBOT) then
local Text = "⌯︙المغادره معطله من قبل المطور الاساسي"
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="• تفعيل •",callback_data="/OnPic:"..data.sender_user_id_}},
	{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}
}
https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false  
end
local Text = "*⌯︙تم مغادرة المجموعه \n⌯︙تم حذف جميع بياناتها*"
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}
}
https.request("https://api.telegram.org/bot"..TokenBot..'/EditMessagecaption?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
ChatLeave(data.chat_id_, XBOT) 
bot_data:srem(XBOT.."MARTEN:Groups",data.chat_id_)
end           
--     source -𝐗-     -- 
if DataText and DataText:match('/Linkinline:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/Linkinline:'..tonumber(data.sender_user_id_)..'(.*)')
if not bot_data:get(XBOT.."MARTEN:Lock:GpLinksinline"..data.chat_id_) then 
tdcli_function({ID ="GetChat",chat_id_=data.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..data.chat_id_)) or bot_data:get(XBOT.."Private:Group:Link"..data.chat_id_) 
if linkgpp.ok == true then 
local Text ='⌯︙𝖫𝗂𝗇𝗄 𝖦𝗋𝗈𝗎𝗉 ↬ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n['..ta.title_..']('..linkgpp.result..')'
keyboard = {} 
keyboard.inline_keyboard = {{{text= ta.title_, url=linkgpp.result}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else 
end 
end,nil) 
end
end
if DataText and DataText:match('/LinkText:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LinkText:'..tonumber(data.sender_user_id_)..'(.*)')
if not bot_data:get(XBOT..'MARTEN:Lock:GpLinks'..data.chat_id_) then 
if bot_data:get(XBOT.."MARTEN:Groups:Links"..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙Group Link ↬ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"..bot_data:get(XBOT.."MARTEN:Groups:Links"..data.chat_id_), 1, "html")
else 
EditMsg(Chat_Id2, Msg_Id2, '⌯︙لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء')
end
else
end
end
--     source -𝐗-     --
if DataText and DataText:match('/TagSudo:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagSudo:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:MARTENSudo:')
text = "⌯︙قائمة المطورين الاساسيين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين اساسيين*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح الاساسيين •",callback_data="/DelMARTENSudo:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagSudoTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagSudoTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:MARTENSudo:')
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المطورين الاساسيين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين اساسيين*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح الاساسيين •",callback_data="/DelMARTENSudo:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagSecondSudo:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagSecondSudo:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:SecondSudo:')
text = "⌯︙قائمة المطورين الثانويين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح الثانويين •",callback_data="/DelSecondSudo:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagSecondSudoTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagSecondSudoTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:SecondSudo:')
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المطورين الثانويين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح الثانويين •",callback_data="/DelSecondSudo:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagSudoBot:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagSudoBot:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:SudoBot:')
text = "⌯︙قائمة المطورين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local sudouser = bot_data:get(XBOT..'MARTEN:Sudos'..v) 
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : "..v.." ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين*"
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المطورين •",callback_data="/DelSudoBot:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagSudoBotTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagSudoBotTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:SudoBot:')
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المطورين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local sudouser = bot_data:get(XBOT..'MARTEN:Sudos'..v) 
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : "..v.." ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين*"
end 
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المطورين •",callback_data="/DelSudoBot:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagOwner:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagOwner:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Owner:'..Chat_Id2)
text = "⌯︙قائمة المالكين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مالكين*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المالكين •",callback_data="/DelOwner:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagOwnerTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagOwnerTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Owner:'..Chat_Id2)
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المالكين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مالكين*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المالكين •",callback_data="/DelOwner:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagBasicConstructor:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagBasicConstructor:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:BasicConstructor:'..Chat_Id2)
text = "⌯︙قائمة المنشئين الاساسيين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد منشئين اساسيين*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المنشئين الاساسيين •",callback_data="/DelBasicConstructor:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagBasicConstructorTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagBasicConstructorTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:BasicConstructor:'..Chat_Id2)
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المنشئين الاساسيين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد منشئين اساسيين*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المنشئين الاساسيين •",callback_data="/DelBasicConstructor:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagConstructor:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagConstructor:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Constructor:'..Chat_Id2)
text = "⌯︙قائمة المنشئين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد منشئين*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المنشئين •",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagConstructorTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagConstructorTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Constructor:'..Chat_Id2)
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المنشئين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد منشئين*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المنشئين •",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagManagers:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagManagers:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Managers:'..Chat_Id2)
text = "⌯︙قائمة المدراء ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مدراء*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المدراء •",callback_data="/DelManager:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagManagersTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagManagersTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Managers:'..Chat_Id2)
text = "⌯︙قائمة المدراء ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مدراء*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المدراء •",callback_data="/DelManager:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagAdmins:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagAdmins:'..tonumber(data.sender_user_id_)..'(.*)')
local SoFi =  'MARTEN:Admins:'..Chat_Id2
local List = bot_data:smembers(XBOT..SoFi)
text = "⌯︙قائمة الادمنيه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ادمنيه*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح الادمنيه •",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagAdminsTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagAdminsTag:'..tonumber(data.sender_user_id_)..'(.*)')
local SoFi =  'MARTEN:Admins:'..Chat_Id2
local List = bot_data:smembers(XBOT..SoFi)
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة الادمنيه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ادمنيه*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح الادمنيه •",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagVipMem:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagVipMem:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:VipMem:'..Chat_Id2)
text = "⌯︙قائمة المميزين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مميزين*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المميزين •",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagVipMemTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagVipMemTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:VipMem:'..Chat_Id2)
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المميزين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مميزين*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المميزين •",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagCleaner:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagCleaner:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Cleaner:'..Chat_Id2)
text = "⌯︙قائمة المنظفين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد منظفين*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المنظفين •",callback_data="/DelCleanr:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/TagCleanerTag:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagCleanerTag:'..tonumber(data.sender_user_id_)..'(.*)')
local List = bot_data:smembers(XBOT..'MARTEN:Cleaner:'..Chat_Id2)
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
text = "⌯︙قائمة المنظفين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد منظفين*"
end
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text="• مسح المنظفين •",callback_data="/DelCleanr:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
--     source -𝐗-     --


--     source -𝐗-     -- 
if DataText and DataText:match('/TagAll:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/TagAll:'..tonumber(data.sender_user_id_)..'(.*)')   
function TagAll(dp1,dp2)
local Tagall = 'TagAll:'..data.sender_user_id_..''
local get = bot_data:get(XBOT.. ''..Tagall..'')
local text = "⌯︙وينكم يالربع \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if bot_data:get(XBOT..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..bot_data:get(XBOT..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
DeleteMessage(Chat_Id2,{[0] = MsgId2})
keyboard = {} 
keyboard.inline_keyboard = {{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..Chat_Id2..'&text=' .. URL.escape(text).."&reply_to_message_id="..get.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(Chat_Id2).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
--     source -𝐗-     --
if DataText and DataText:match('/lockorder:(.*)') then
local MARTEN = DataText:match('/lockorder:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local order = bot_data:get(XBOT..'MARTEN:order')
local Text = [[
⌯︙اهلا بك في قائمة اوامر التعطيل والتفعيل ↫ ⤈ 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙يمكنك التعطيل والتفعيل عن طريق الازرار بلاسفل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• تعطيل الايدي بالصوره •",callback_data="/LockIdPhoto:"..data.sender_user_id_},{text="• تفعيل الايدي بالصوره •",callback_data="/UnLockIdPhoto:"..data.sender_user_id_}},{{text="• تعطيل الايدي •",callback_data="/LockId:"..data.sender_user_id_},{text="• تفعيل الايدي •",callback_data="/UnLockId:"..data.sender_user_id_}},{{text="• تعطيل الرابط •",callback_data="/LockGpLinks:"..data.sender_user_id_},{text="• تفعيل الرابط •",callback_data="/UnLockGpLinks:"..data.sender_user_id_}},{{text="• تعطيل الرابط انلاين •",callback_data="/LockGpLinksinline:"..data.sender_user_id_},{text="• تفعيل الرابط انلاين •",callback_data="/UnLockGpLinksinline:"..data.sender_user_id_}},{{text="• تعطيل الترحيب •",callback_data="/LockWelcome:"..data.sender_user_id_},{text="• تفعيل الترحيب •",callback_data="/UnLockWelcome:"..data.sender_user_id_}},{{text="• تعطيل الردود المطور •",callback_data="/LockAllRed:"..data.sender_user_id_},{text="• تفعيل الردود المطور •",callback_data="/UnLockAllRed:"..data.sender_user_id_}},{{text="• تعطيل ردود المدير •",callback_data="/LockGpRed:"..data.sender_user_id_},{text="• تفعيل ردود المدير •",callback_data="/UnLockGpRed:"..data.sender_user_id_}},{{text="• تعطيل نزلني •",callback_data="/LockDelMe:"..data.sender_user_id_},{text="• تفعيل نزلني •",callback_data="/UnLockDelMe:"..data.sender_user_id_}},{{text="• تعطيل اطردني •",callback_data="/LockKickMe:"..data.sender_user_id_},{text="• تفعيل اطردني •",callback_data="/UnLockKickMe:"..data.sender_user_id_}},{{text="• تعطيل الحظر •",callback_data="/LockKickBan:"..data.sender_user_id_},{text="• تفعيل الحظر •",callback_data="/UnLockKickBan:"..data.sender_user_id_}},{{text="• تعطيل الرفع •",callback_data="/LockProSet:"..data.sender_user_id_},{text="• تفعيل الرفع •",callback_data="/UnLockProSet:"..data.sender_user_id_}},{{text="• تعطيل الالعاب •",callback_data="/LockGames:"..data.sender_user_id_},{text="• تفعيل الالعاب •",callback_data="/UnLockGames:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/HelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(order or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     source -𝐗-     --
if DataText and DataText:match('/LockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT..'MARTEN:Lock:Id:Photo'..data.chat_id_,true)
Text = "*⌯︙تم تعطيل الايدي بالصوره*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/unLockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/unLockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Lock:Id:Photo'..data.chat_id_)
Text = "*⌯︙تم تفعيل الايدي بالصوره*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockId:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockId:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT..'MARTEN:Lock:Id'..data.chat_id_,true)
Text = "*⌯︙تم تعطيل الايدي*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/unLockId:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/unLockId:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Lock:Id'..data.chat_id_)
Text = "*⌯︙تم تفعيل الايدي*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."MARTEN:Lock:GpLinks"..data.chat_id_,"ok")
Text = "*⌯︙تم تعطيل الرابط*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/unLockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/unLockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:Lock:GpLinks"..data.chat_id_)
Text = "*⌯︙تم تفعيل الرابط*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."MARTEN:Lock:GpLinksinline"..data.chat_id_,"ok")
Text = "*⌯︙تم تعطيل الرابط انلاين*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:Lock:GpLinksinline"..data.chat_id_)
Text = "*⌯︙تم تفعيل الرابط انلاين*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockWelcome:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockWelcome:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:Lock:Welcome"..data.chat_id_)
Text = "*⌯︙تم تعطيل الترحيب*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockWelcome:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockWelcome:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."MARTEN:Lock:Welcome"..data.chat_id_,true)
Text = "*⌯︙تم تفعيل الترحيب*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT..'MARTEN:Lock:AllRed'..data.chat_id_,true)
Text = "*⌯︙تم تعطيل ردود المطور*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Lock:AllRed'..data.chat_id_)
Text = "*⌯︙تم تفعيل ردود المطور*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGpRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockGpRed:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT..'MARTEN:Lock:GpRed'..data.chat_id_,true)
Text = "*⌯︙تم تعطيل ردود المدير*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockGpRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockGpRed:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Lock:GpRed'..data.chat_id_)
Text = "*⌯︙تم تفعيل ردود المدير*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockDelMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockDelMe:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."MARTEN:Del:Me"..data.chat_id_, true)
Text = "*⌯︙تم تعطيل نزلني*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockDelMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockDelMe:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:Del:Me"..data.chat_id_)
Text = "*⌯︙تم تفعيل نزلني*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockKickMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockKickMe:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."MARTEN:Kick:Me"..data.chat_id_, true)
Text = "*⌯︙تم تعطيل اطردني*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockKickMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockKickMe:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:Kick:Me"..data.chat_id_)
Text = "*⌯︙تم تفعيل اطردني*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockKickBan:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockKickBan:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."MARTEN:Lock:KickBan"..data.chat_id_,"true")
Text = "*⌯︙تم تعطيل الحظر*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockKickBan:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockKickBan:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:Lock:KickBan"..data.chat_id_)
Text = "*⌯︙تم تفعيل الحظر*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockProSet:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockProSet:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT.."MARTEN:Lock:ProSet"..data.chat_id_,"true")
Text = "*⌯︙تم تعطيل الرفع*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLocProSet:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLocProSet:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT.."MARTEN:Lock:ProSet"..data.chat_id_)
Text = "*⌯︙تم تفعيل الرفع*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGames:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/LockGames:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:set(XBOT..'MARTEN:Lock:Games'..data.chat_id_,true)  
Text = "*⌯︙تم تعطيل الالعاب*\n•-› X"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockGames:'..tonumber(data.sender_user_id_)..'(.*)') then
local MARTEN = DataText:match('/UnLockGames:'..tonumber(data.sender_user_id_)..'(.*)')
bot_data:del(XBOT..'MARTEN:Lock:Games'..data.chat_id_) 
Text = "*⌯︙تم تفعيل الالعاب*\n•-› ✓"
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• رجوع •",callback_data="/lockorder:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if DataText and DataText:match('/HideHelpList:(.*)') then
local MARTEN = DataText:match('/HideHelpList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم اخفاء الكليشه ") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
--     source -𝐗-     --

if DataText and DataText:match('/HideChannelVip:(.*)') then
local MARTEN = DataText:match('/HideChannelVip:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم اخفاء امر وضع قناتي") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
--     source -𝐗-     --
if DataText and DataText:match('/HelpList:(.*)') then
local MARTEN = DataText:match('/HelpList:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Help = bot_data:get(XBOT..'MARTEN:Help')
local Text = [[
⚙️ | اهلاً أنتَ في أوامر البوت الرئيسية 🔏
⚙️ | أختر في الاسفل الأمر المراد  🔍 .
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙ • ↫ اوامر الحمايـة .
⌯︙ • ↫ اوامر الادمنيـة . 
⌯︙ • ↫ اوامر المـدراء .
⌯︙ • ↫ اوامر المنشئيـن .
⌯︙ • ↫ اوامر المطوريـن .
⌯︙ • ↫ اوامر الاعضـاء .
⌯︙ • ↫ اوامر الرتـب .
⌯︙ • ↫ القفل والفـتح .
⌯︙ • ↫ التفعيل والتعطـيل .
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اوامر الرتب •",callback_data="/DelList:"..data.sender_user_id_}},{{text="• التفعيل و التعطيل •",callback_data="/lockorder:"..data.sender_user_id_},{text="• القفل و الفتح •",callback_data="/locklist:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local MARTEN = DataText:match('/HelpList1:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا ليس لديك صلاحية التحكم لهذا الامر •")..'&show_alert=true')
end
local Help = bot_data:get(XBOT..'MARTEN:Help1')
local Text = [[
⌯︙اوامر حمايـة المجموعـة ↫ ⤈ 👨🏻‍💻
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • قفل • فتح ↫ الروابط
 • قفل • فتح ↫ المعرفات
 • قفل • فتح ↫ البوتات
 • قفل • فتح ↫ المتحركه
 • قفل • فتح ↫ الملصقات
 • قفل • فتح ↫ الملفات
 • قفل • فتح ↫ الصور
 • قفل • فتح ↫ الفيديو
 • قفل • فتح ↫ الاونلاين
 • قفل • فتح ↫ الدردشه
 • قفل • فتح ↫ التوجيه
 • قفل • فتح ↫ الاغاني
 • قفل • فتح ↫ الصوت
 • قفل • فتح ↫ الجهات
 • قفل • فتح ↫ الماركداون
 • قفل • فتح ↫ التكرار
 • قفل • فتح ↫ الهاشتاك
 • قفل • فتح ↫ التعديل
 • قفل • فتح ↫ التثبيت
 • قفل • فتح ↫ الاشعارات
 • قفل • فتح ↫ الكلايش
 • قفل • فتح ↫ الدخول
 • قفل • فتح ↫ الشبكات
 • قفل • فتح ↫ المواقع
 • قفل • فتح ↫ الفشار
 • قفل • فتح ↫ الكفر
 • قفل • فتح ↫ الطائفيه
 • قفل • فتح ↫ الكل
 • قفل • فتح ↫ العربيه 
 • قفل • فتح ↫ الاباحي
 • قفل • فتح ↫ الانكليزيه
 • قفل • فتح ↫ الفارسيه
 • قفل • فتح ↫ التفليش
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر حمايه اخرى ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • قفل • فتح + الامر ↫ ⤈
 • التكرار بالطرد
 • التكرار بالكتم
 • التكرار بالتقيد
 • الفارسيه بالطرد
 • البوتات بالطرد
 • البوتات بالتقيد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local MARTEN = DataText:match('/HelpList2:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا ليس لديك صلاحية التحكم لهذا الامر •")..'&show_alert=true')
end
local Help = bot_data:get(XBOT..'MARTEN:Help2')
local Text = [[
⌯︙اوامر الادمنيـة ↫ ⤈ 👨🏻‍🔧
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • الاعدادت
 • تاك للكل 
 • انشاء رابط
 • ضع وصف
 • ضع رابط
 • ضع صوره
 • حذف الرابط
 • كشف البوتات
 • طرد البوتات
 • تنظيف + العدد
 • تنظيف التعديل
 • كللهم + الكلمه
 • اسم البوت + الامر
 • ضع • حذف ↫ ترحيب
 • ضع • حذف ↫ قوانين
 • اضف • حذف ↫ صلاحيه
 • الصلاحيات • حذف الصلاحيات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • ضع سبام + العدد
 • ضع تكرار + العدد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • رفع مميز • تنزيل مميز
 • المميزين • حذف المميزين
 • كشف القيود • رفع القيود
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • حذف • مسح + بالرد
 • منع • الغاء منع
 • قائمه المنع
 • حذف قائمه المنع
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تفعيل • تعطيل ↫ الرابط
 • تفعيل • تعطيل ↫ الالعاب
 • تفعيل • تعطيل ↫ الترحيب
 • تفعيل • تعطيل ↫ التاك للكل
 • تفعيل • تعطيل ↫ كشف الاعدادات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • طرد المحذوفين
 • طرد ↫ بالرد • بالمعرف • بالايدي
 • كتم • الغاء كتم
 • تقيد • الغاء تقيد
 • حظر • الغاء حظر
 • المكتومين • حذف المكتومين
 • المقيدين • حذف المقيدين
 • المحظورين • حذف المحظورين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تقييد دقيقه + عدد الدقائق
 • تقييد ساعه + عدد الساعات
 • تقييد يوم + عدد الايام
 • الغاء تقييد ↫ لالغاء التقييد بالوقت
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local MARTEN = DataText:match('/HelpList3:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا ليس لديك صلاحية التحكم لهذا الامر •")..'&show_alert=true')
end
local Help = bot_data:get(XBOT..'MARTEN:Help3')
local Text = [[
⌯︙اوامر المـدراء ↫ ⤈ 👨🏼‍✈️
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • فحص البوت
 • ضع اسم + الاسم
 • اضف • حذف ↫ رد
 • ردود المدير
 • حذف ردود المدير
 • اضف • حذف ↫ رد متعدد
 • حذف رد من متعدد
 • الردود المتعدده
 • حذف الردود المتعدده
 • حذف قوائم المنع
 • منع ↫ بالرد على ( ملصق • صوره • متحركه )
 • حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تنزيل الكل
 • رفع ادمن • تنزيل ادمن
 • الادمنيه • حذف الادمنيه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تثبيت
 • الغاء التثبيت
 • اعاده التثبيت
 • الغاء تثبيت الكل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تغير رد + اسم الرتبه + النص ↫ ⤈
 • المطور • منشئ الاساسي
 • المنشئ • المدير • الادمن
 • المميز • المنظف • العضو
 • حذف ردود الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تغيير الايدي ↫ لتغيير الكليشه
 • تعيين الايدي ↫ لتعيين الكليشه
 • حذف الايدي ↫ لحذف الكليشه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تفعيل • تعطيل + الامر ↫ ⤈
 • اطردني • الايدي بالصوره • الابراج
 • معاني الاسماء • اوامر النسب • انطق
 • الايدي • تحويل الصيغ • اوامر التحشيش
 • ردود المدير • ردود المطور • التحقق
 • ضافني • حساب العمر • الزخرفه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local MARTEN = DataText:match('/HelpList4:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا ليس لديك صلاحية التحكم لهذا الامر •")..'&show_alert=true')
end
local Help = bot_data:get(XBOT..'MARTEN:Help4')
local Text = [[
⌯︙اوامر المنشئيـن ↫ ⤈ 🤵🏼‍♂️
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تنزيل الكل
 • الميديا • امسح
 • تعين عدد الحذف
 • ترتيب الاوامر
 • اضف • حذف ↫ امر
 • حذف الاوامر المضافه
 • الاوامر المضافه
 • اضف نقاط ↫ بالرد • بالايدي
 • اضف رسائل ↫ بالرد • بالايدي
 • رفع منظف • تنزيل منظف
 • المنظفين • حذف المنظفين
 • رفع مدير • تنزيل مدير
 • المدراء • حذف المدراء
 • تفعيل • تعطيل + الامر ↫ ⤈
 • نزلني • امسح
 • الحظر • الكتم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المنشئين الاساسيين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • وضع لقب + اللقب
 • تفعيل • تعطيل ↫ الرفع
 • رفع منشئ • تنزيل منشئ
 • المنشئين • حذف المنشئين
 • رفع • تنزيل ↫ مشرف
 • رفع بكل الصلاحيات
 • حذف القوائم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المالكين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • رفع • تنزيل ↫ منشئ اساسي
 • حذف المنشئين الاساسيين 
 • المنشئين الاساسيين 
 • حذف جميع الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local MARTEN = DataText:match('/HelpList5:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا ليس لديك صلاحية التحكم لهذا الامر •")..'&show_alert=true')
end
local Help = bot_data:get(XBOT..'MARTEN:Help5')
local Text = [[
⌯︙اوامر المطوريـن ↫ ⤈ 👨🏼‍✈️
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • الكروبات
 • المطورين
 • المشتركين
 • الاحصائيات
 • المجموعات
 • اسم البوت + غادر
 • اسم البوت + تعطيل
 • كشف + -ايدي المجموعه
 • رفع مالك • تنزيل مالك
 • المالكين • حذف المالكين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • رفع • تنزيل ↫ مدير عام
 • حذف • المدراء العامين 
 • رفع • تنزيل ↫ ادمن عام
 • حذف • الادمنيه العامين 
 • رفع • تنزيل ↫ مميز عام
 • حذف • المميزين عام 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • اوامر المطور الاساسي ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تحديث
 • السيرفر
 • روابط الكروبات
 • تحديث السورس
 • تنظيف الكروبات
 • تنظيف المشتركين
 • حذف جميع الملفات
 • تعيين الايدي العام
 • تغير المطور الاساسي
 • حذف معلومات الترحيب
 • تغير معلومات الترحيب
 • غادر + -ايدي المجموعه
 • تعيين عدد الاعضاء + العدد
 • حظر عام • الغاء العام
 • كتم عام • الغاء العام
 • قائمه العام • حذف قائمه العام
 • وضع • حذف ↫ اسم البوت
 • اضف • حذف ↫ رد عام
 • ردود المطور • حذف ردود المطور
 • تعيين • حذف • جلب ↫ رسالة الستارت
 • جلب نسخه الكروبات
 • رفع النسخه + بالرد على الملف
 • تعيين • حذف ↫ قناة الاشتراك
 • جلب كليشه الاشتراك
 • تغيير • حذف ↫ كليشه الاشتراك
 • رفع • تنزيل ↫ مطور
 • المطورين • حذف المطورين
 • رفع • تنزيل ↫ مطور ثانوي
 • الثانويين • حذف الثانويين
 • تعيين • حذف ↫ كليشة الايدي
 • اذاعه للكل بالتوجيه ↫ بالرد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تفعيل ملف + اسم الملف
 • تعطيل ملف + اسم الملف
 • تفعيل • تعطيل + الامر ↫ ⤈
 • الاذاعه • الاشتراك الاجباري
 • ترحيب البوت • المغادره
 • البوت الخدمي • التواصل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local MARTEN = DataText:match('/HelpList6:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Help = bot_data:get(XBOT..'MARTEN:Help6')
local Text = [[
⌯︙اوامر الاعضـاء ↫ ⤈ 👥
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • السورس • موقعي • رتبتي • معلوماتي 
 • رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
 • ميمز • متحركه • صوره • ريمكس • فلم • مسلسل • انمي
 • رسائلي • حذف رسائلي • اسمي • معرفي 
 • ايدي •ايديي • جهاتي • راسلني • الالعاب 
 • نقاطي • بيع نقاطي • القوانين • زخرفه 
 • رابط الحذف • نزلني • اطردني • المطور 
 • منو ضافني • مشاهدات المنشور • الرابط 
 • ايدي المجموعه • معلومات المجموعه 
 • نسبه الحب • نسبه الكره • نسبه الغباء 
 • نسبه الرجوله • نسبه الانوثه • التفاعل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • لقبه + بالرد
 • كول + الكلمه
 • زخرفه + اسمك
 • برج + نوع البرج
 • معنى اسم + الاسم
 • بوسه • بوسها ↫ بالرد
 • احسب + تاريخ ميلادك
 • صلاحياته ↫ بالرد • بالمعرف • بالايدي
 • ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
 • تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
 • انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اوامر التحشيش •",callback_data="/HelpList0:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر التحشيش •",callback_data="/HelpList0:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر التحشيش •",callback_data="/HelpList0:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر التحشيش •",callback_data="/HelpList0:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
else
keyboard.inline_keyboard = {{{text="• اوامر التحشيش •",callback_data="/HelpList0:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList0:(.*)') then
local MARTEN = DataText:match('/HelpList0:(.*)')
if tonumber(MARTEN) == tonumber(data.sender_user_id_) then
local Help = bot_data:get(XBOT..'MARTEN:Help0')
local Text = [[
🤹🏻┇𝐟𝐮𝐧𝐧𝐲 𝐨𝐫𝐝𝐞𝐫𝐬.
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
⌯︙ الاوامر التحشيش 🃏
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
⌯︙ رفع + تنزيل ← الامࢪ ↓
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← مطي 
	• المطايه - المطاية
	• حذف المطايه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← صخل
	• الصخوله - صخوله
	•  حذف الصخوله
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← جلب
	•  الجلاب - جلاب
	• حذف الحلاب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← قرد 
	•  القروده - قروده
	• حذف القروده
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← بقره
	•  البقرات - الهوايش
	• حذف البقرات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← ضلع
	•  الضلوع - ضلوعي
	• حذف الضلوع
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← ضلعه
	•  الضلعات - ضلعاتي
	• حذف الضلعات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← طلي
	•  الطليان - طليان
	• حذف الطليان
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← زاحف 
	•  زواحف - الزواحف
	• حذف الزواحف
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← جريذي
	•  الجريذيه - جريذيه
	• حذف الجريذيه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← الصاك
	•  الصاكين - صاكين
	• حذف الصاكين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
	• رفع + تنزيل ← الحاته
	•  الحاتات - حاتات
	• حذف الحاتات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
else
keyboard.inline_keyboard = {{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("• عذرا الامر ليس لك •")..'&show_alert=true')
end
end
end
--     source -𝐗-     --
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and bot_data:get(XBOT.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = bot_data:get(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
bot_data:del(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
bot_data:del(XBOT.."Set:Cmd:Group:New"..msg.chat_id_)
bot_data:srem(XBOT.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الامر من المجموعه", 1, 'html')  
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لايوجد امر بهذا الاسم", 1, 'html')
end
bot_data:del(XBOT.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(bot_data:get(XBOT..'MARTEN:NameBot') or "اكس")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(bot_data:get(XBOT..'MARTEN:NameBot') or "اكس")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = bot_data:get(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and bot_data:get(XBOT.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
bot_data:set(XBOT.."Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل الامر الجديد", 1, 'html')
bot_data:del(XBOT.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
bot_data:set(XBOT.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and bot_data:get(XBOT.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = bot_data:get(XBOT.."Set:Cmd:Group:New"..msg.chat_id_)
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الامر", 1, 'html')
bot_data:del(XBOT.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = bot_data:smembers(XBOT.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "⌯︙قائمة الاوامر المضافه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
Cmds = bot_data:get(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "⌯︙لاتوجد اوامر مضافه في المجموعه"
end
local inline = {{{text="• مسح الاوامر المضافه •",callback_data="/DelCmd:"..msg.sender_user_id_},{text="• ترتيب الاوامر •",callback_data="/SetCmd:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,t,nil,inline,msg.id_/2097152/0.5)
end
if text == "حذف الاوامر المضافه" and ChCheck(msg) or text == "حذف الاوامر" and ChCheck(msg) or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = bot_data:smembers(XBOT.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
bot_data:del(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
bot_data:del(XBOT.."List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "حذف الاوامر المضافه" and ChCheck(msg) or text == "حذف الاوامر" and ChCheck(msg) or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = bot_data:smembers(XBOT.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
bot_data:del(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
bot_data:del(XBOT.."List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "ترتيب الاوامر" and Constructor(msg) and ChCheck(msg) then
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"ا")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"م")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"اد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"مد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"من")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"اس")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":مط","رفع مطور")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"مط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":ثانوي","رفع مطور ثانوي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"ثانوي")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"تك")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":ر","الرابط")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"ر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":رر","ردود المدير")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"رر")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":،،","مسح المكتومين")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"،،")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"رد")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":سح","مسح سحكاتي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"سح")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":رس","مسح رسائلي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"رس")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":غ","غنيلي")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"غ")
bot_data:set(XBOT.."Set:Cmd:Group:New1"..msg.chat_id_..":#","مسح قائمه العام")
bot_data:sadd(XBOT.."List:Cmd:Group:New"..msg.chat_id_,"#")
send(msg.chat_id_, msg.id_,"⌯︙تم ترتيب الاوامر بالشكل التالي ~\n⌯︙ ايدي - ا .\n⌯︙ رفع مميز - م .\n⌯︙رفع ادمن - اد .\n⌯︙ رفع مدير - مد . \n⌯︙ رفع منشى - من . \n⌯︙ رفع منشئ الاساسي - اس  .\n⌯︙ رفع مطور - مط .\n⌯︙رفع مطور ثانوي - ثانوي .\n⌯︙ تنزيل الكل - تك .\n⌯︙ تعطيل الايدي بالصوره - تعط .\n⌯︙ تفعيل الايدي بالصوره - تفع .\n⌯︙ الرابط - ر .\n⌯︙ ردود المدير - رر .\n⌯︙ مسح المكتومين - ،، .\n⌯︙ اضف رد - رد .\n⌯︙ مسح سحكاتي - سح .\n⌯︙ مسح رسائلي - رس .\n⌯︙ غنيلي - غ .\n⌯︙مسح قائمه العام")  
end
if text == "اضف امر" and ChCheck(msg) or text == "اضافة امر" and ChCheck(msg) or text == "اضافه امر" and ChCheck(msg) then
bot_data:set(XBOT.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" and ChCheck(msg) or text == "مسح امر" and ChCheck(msg) then 
bot_data:set(XBOT.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     source -𝐗-     --
if text == "الصلاحيات" and ChCheck(msg) or text == "صلاحيات" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT.."Coomds"..msg.chat_id_)
if #List == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "⌯︙قائمة الصلاحيات المضافه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
var = bot_data:get(XBOT.."Comd:New:rt:MARTEN:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." • ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
send(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = bot_data:smembers(XBOT.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
bot_data:del(XBOT.."Comd:New:rt:MARTEN:"..v..msg.chat_id_)
bot_data:del(XBOT.."Coomds"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
bot_data:set(XBOT.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
bot_data:sadd(XBOT.."Coomds"..msg.chat_id_,ComdNew)  
bot_data:setex(XBOT.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n⌯︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
bot_data:del(XBOT.."Comd:New:rt:MARTEN:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الصلاحيه", 1, 'html')
end
if bot_data:get(XBOT.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^↫ الغاء ⌯$") then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر", 1, 'html')
bot_data:del(XBOT.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n⌯︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تستطيع اضافة صلاحية ( عضو • مميز )\n⌯︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙تستطيع اضافة صلاحية ( عضو )\n⌯︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = bot_data:get(XBOT.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
bot_data:set(XBOT.."Comd:New:rt:MARTEN:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اضافة الصلاحيه", 1, 'html')
bot_data:del(XBOT.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_SoFi = text:match("رفع (.*)")
if bot_data:sismember(XBOT.."Coomds"..msg.chat_id_,DEV_SoFi) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrSoFi = bot_data:get(XBOT.."Comd:New:rt:MARTEN:"..DEV_SoFi..msg.chat_id_)
if mrSoFi == "مميز" and VipMem(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› ✓', 1, 'md')
bot_data:set(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_SoFi) 
bot_data:sadd(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrSoFi == "ادمن" and Admin(msg) then 
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› ✓', 1, 'md')
bot_data:set(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_SoFi)
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrSoFi == "مدير" and Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› ✓', 1, 'md')
bot_data:set(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_SoFi)  
bot_data:sadd(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrSoFi == "عضو" then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› ✓', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_SoFi = text:match("تنزيل (.*)")
if bot_data:sismember(XBOT.."Coomds"..msg.chat_id_,DEV_SoFi) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrSoFi = bot_data:get(XBOT.."Comd:New:rt:MARTEN:"..DEV_SoFi..msg.chat_id_)
if mrSoFi == "مميز" and VipMem(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› X', 1, 'md')
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:del(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrSoFi == "ادمن" and Admin(msg) then 
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› X', 1, 'md')
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:del(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrSoFi == "مدير" and Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› X', 1, 'md')
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:del(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrSoFi == "عضو" then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoFi..' ❩ بنجاح\n•-› X', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if bot_data:sismember(XBOT.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrSoFi = bot_data:get(XBOT.."Comd:New:rt:MARTEN:"..text1[2]..msg.chat_id_)
if mrSoFi == "مميز" and VipMem(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح\n•-› ✓', 1, 'md')
bot_data:sadd(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:set(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrSoFi == "ادمن" and Admin(msg) then 
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح\n•-› ✓', 1, 'md')
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:set(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrSoFi == "مدير" and Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح\n•-› ✓', 1, 'md')
bot_data:sadd(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:set(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrSoFi == "عضو" then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح\n•-› ✓', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "⌯︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if bot_data:sismember(XBOT.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrSoFi = bot_data:get(XBOT.."Comd:New:rt:MARTEN:"..text1[2]..msg.chat_id_)
if mrSoFi == "مميز" and VipMem(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح\n•-› X', 1, 'md')
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:del(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrSoFi == "ادمن" and Admin(msg) then 
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح\n•-› X', 1, 'md')
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:del(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrSoFi == "مدير" and Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح\n•-› X', 1, 'md')
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:del(XBOT.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrSoFi == "عضو" then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'SrcX_B0T')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح\n•-› X', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "⌯︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     source -𝐗-     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
bot_data:incr(XBOT..'MARTEN:UsersMsgs'..XBOT..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
bot_data:incr(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
bot_data:incr(XBOT..'MARTEN:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType ='sp' 
elseif id:match("^(%d+)") then
if not bot_data:sismember(XBOT.."MARTEN:Users",msg.chat_id_) then
bot_data:sadd(XBOT.."MARTEN:Users",msg.chat_id_)
end
ChatType ='pv' 
else
ChatType ='gp' 
end
end 
--     source -𝐗-     --
if ChatType =='pv' then 
if text =='/start' or text =='رجوع ،🔙‘' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙مرحبا عزيزي المطور \n⌯︙انت المطور الاساسي هنا \n⌯︙اليك ازرار سورس اكس \n⌯︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ السورس ⌯','وضع اسم البوت'},
    {'↫  المطورين ⌯','↫ الاحصائيات ⌯'},
    {'↫ التفعيل والتعطيل ⌯','↫ الاذاعه ⌯'},
    {'↫ المتجر ⌯','↫ رسالة ستارت ⌯','↫ العام ⌯'},
    {'↫ الاشتراك الاجباري ⌯','↫ الاوامر الخدميه ⌯'},
    {"↫ تعيين كلايش الاوامر ⌯"},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ تعيين كلايش الاوامر ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'تغير معلومات الترحيب'},
    {'حذف كليشة الايدي','تعيين كليشة الايدي'},
    {'تعيين امر الاوامر'},
    {'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
    {'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
    {'استعادة كلايش الاوامر'},
    {'رجوع ،🔙‘'}
}

SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ السورس ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بتحديث  سورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ تحديث السورس ⌯','↫ تحديث ⌯'},
    {'↫ السيرفر ⌯'},
    {'↫ مبرمج السورس ⌯','↫ قناة السورس ⌯','↫ مطور السورس ⌯'},
    {'↫  السورس ⌯'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ الاحصائيات ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه ب أحصائيات  سورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫  الاحصائيات ⌯'},
    {'↫ المشتركين ⌯','↫ المجموعات ⌯'},
    {'↫ روابط المجموعات ⌯','↫ جلب نسخه احتياطيه ⌯'},
    {'↫ تنظيف المشتركين ⌯','↫ تنظيف المجموعات ⌯'},
    {'↫ نقل الاحصائيات ⌯'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫  المطورين ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه ب المطورين لسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ الاساسيين ⌯','مسح الاساسيين'},
    {'↫ الثانويين ⌯','مسح الثانويين'},
    {'↫ المطورين ⌯','مسح المطورين'},
    {'↫ تغير المطور الاساسي ⌯','↫ تغيير كليشه المطور ⌯'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ التفعيل والتعطيل ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه ب التفعيل والتعطيل لسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ تعطيل التواصل ⌯','↫ تفعيل التواصل ⌯'},
    {'↫ تعطيل ترحيب البوت ⌯','↫ تفعيل ترحيب البوت ⌯'},
    {'↫ تعطيل المغادره ⌯','↫ تفعيل المغادره ⌯'},
    {'↫ تعطيل الاذاعه ⌯','↫ تفعيل الاذاعه ⌯'},
    {'↫ تعطيل البوت الخدمي ⌯','↫ تفعيل البوت الخدمي ⌯'},
    {'↫ تعطيل النسخه التلقائيه ⌯','↫ تفعيل النسخه التلقائيه ⌯'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ الاذاعه ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بالاذاعه لسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ اذاعه بالتثبيت ⌯'},
    {'↫ اذاعه خاص ⌯','↫ اذاعه عام ⌯'},
    {'↫ اذاعه خاص بالتوجيه ⌯','↫ اذاعه عام بالتوجيه ⌯'},
    {'الغاء'},
    {'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ العام ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بالعام لسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ اضف رد عام ⌯','↫ حذف رد عام ⌯'},
    {'↫ ردود العام ⌯','↫ مسح ردود العام ⌯'},
    {'↫ قائمه العام ⌯','مسح قائمه العام'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ رسالة ستارت ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه برسالة ستارت لسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ تعيين رسالة الستارت ⌯','↫ حذف رسالة الستارت ⌯'},
    {'↫ جلب رسالة الستارت ⌯'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ المتجر ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه المتجر الخاص لسورس اكس فقط اضغط على الملف الذي تريد تفعيل او تعطيله'
local Get_Files, res = https.request("https://raw.githubusercontent.com/XBOT-MAIN/Files_XBOT/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n⌯︙قائمة ملفات متجر سورس اكس\n⌯︙الملفات المتوفره حاليا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
local TextE = "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙علامة ↫ (✔) تعني الملف مفعل\n⌯︙علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Shop_XBOT/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."⌯︙"..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
local key = {
{'تعطيل ملف AutoFile.lua','تفعيل ملف AutoFile.lua'},
{'تعطيل ملف ReplyBot.lua','تفعيل ملف ReplyBot.lua'},
{'تعطيل ملف TagAll.lua','تفعيل ملف TagAll.lua'},
{'تعطيل ملف ProNames.lua','تفعيل ملف ProNames.lua'},
{'تعطيل ملف TagAdmins.lua','تفعيل ملف TagAdmins.lua'},
{'تعطيل ملف AddedMe.lua','تفعيل ملف AddedMe.lua'},
{'تعطيل ملف ChangeName.lua','تفعيل ملف ChangeName.lua'},
{'تعطيل ملف ChangeUser.lua','تفعيل ملف ChangeUser.lua'},
{'تعطيل ملف ChangePhoto.lua','تفعيل ملف ChangePhoto.lua'},
{'تعطيل ملف MuteNames.lua','تفعيل ملف MuteNames.lua'},
{'رجوع ،🔙‘'},
}
send(msg.chat_id_, msg.id_,Sudo_Welcome)
SendInline(msg.chat_id_,TextS..TextE,key)
return false
end 
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد اتصال من الـapi") 
end
end
end
if text =='↫ الاشتراك الاجباري ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بالاشتراك الاجباري لسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫  تفعيل الاشتراك الاجباري ⌯','↫  تعطيل الاشتراك الاجباري ⌯'},
    {'↫ تعيين قناة الاشتراك ⌯',' ↫ حذف قناة الاشتراك ⌯'},
    {'↫ تغير كليشه الاشتراك ⌯','↫ حذف كليشه الاشتراك ⌯'},
    {'↫ كليشه الاشتراك ⌯','↫ قناة الاشتراك ⌯'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text =='↫ الاوامر الخدميه ⌯' or text =='/play' or text =='↫  رجوع  ⌯' or text =='اوامر الخدميه' or text =='/free' then
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي \n⌯︙اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ اوامر التسليه ⌯','↫ الاوامر الخدميه  ⌯'},
    {'↫ اوامر النسب ⌯','↫ العاب ⌯'},
    {'↫  السورس ⌯','↫  المطور ⌯'},
    {'رجوع ،🔙‘'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text =='↫ اوامر التسليه ⌯' then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي \n⌯︙اليك الازرار الخاصه بأوامر التسليه الخاصه بسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ غنيلي ⌯','↫ اغنيه ⌯'},
    {'↫ ميمز ⌯','↫ ريمكس ⌯'},
    {'↫ صوره ⌯','↫ متحركه ⌯'},
    {'↫ مسلسل ⌯','↫ فلم ⌯'},
    {'↫  رجوع  ⌯'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text =='↫ الاوامر الخدميه  ⌯' then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي \n⌯︙اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ الابراج ⌯','↫ حساب العمر ⌯'},
    {'↫ الزخرفه ⌯','↫ معاني الاسماء ⌯'},
    {'↫ الحمايه ⌯'},
    {'↫  معرفي ⌯','↫  اسمي ⌯','↫ ايديي ⌯'},
    {'↫  نبذتي ⌯','↫ نبذا ⌯'},{'↫  رجوع  ⌯'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
--if text =='↫ البوتات ⌯' then 
--local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي \n⌯︙اليك الازرار الخاصه بأوامر البوتات الخاصه بسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
--local key = {
--    {'↫ بوت الحذف ⌯','↫ بوت الهمسه ⌯'},
--    {'↫ بوت اليوتيوب ⌯','↫ بوت الكت ⌯'},
--    {'↫ بوت الزخرفه ⌯'},
--    {'↫  رجوع  ⌯'}
--}
--SendInline(msg.chat_id_,Sudo_Welcome,key)
--return false
--end
if text =='↫ اوامر النسب ⌯' then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي \n⌯︙اليك الازرار الخاصه بأوامر النسب الخاصه بسورس اكس فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
    {'↫ نسبه الكره ⌯','↫ نسبه الحب ⌯'},
    {'↫ نسبه الرجوله ⌯','↫ نسبه الانوثه ⌯'},
    {'↫ نسبه الغباء ⌯','↫ نسبه الجمال ⌯'},
    {'↫ نسبه الخيانه ⌯'},
    {'↫  رجوع  ⌯'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text =='↫ العاب ⌯' then 
local Sudo_Welcome ='⌯︙اهلا بك مجددا عزيزي \n⌯︙اليك الازرار الخاصه بألعاب سورس اكس فقط اضغط على اللعبه الذي تريد لعبها'
local key = {
    {'↫ الالعاب ⌯','↫ الالعاب المتطوره ⌯'},
    {'↫ كت ⌯'},
    {'↫ سمايلات ⌯','↫ معاني ⌯'},
    {'↫ ترتيب ⌯','↫ حزوره ⌯'},
    {'↫ العكس ⌯','↫ المختلف ⌯'},
    {'↫ امثله ⌯','↫ اسئله ⌯'},
    {'↫ تخمين ⌯',''},
    {'↫ رياضيات ⌯','↫ انكليزي ⌯'},
    {'↫  رجوع  ⌯'}
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
--     source -𝐗-     --
if text == '/start' and ChCheck(msg) then  
if not bot_data:get(XBOT..'MARTEN:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=XBoT},function(arg,dp) 
local bot_username = bot_data:get(Server_XBOT.."Token_username")
local inline = { 
{{text = "⌯ اضف البوت في مجموعتك .", url="http://t.me/"..bot_username.."?startgroup=start"}}, 
{{text="⌯ المطور .",url="t.me/"..dp.username_ or "SrcX_B0T"},{text="⌯ شراء بوت .",url="t.me/SrcX_B0Tbot"}}}
local start = bot_data:get(XBOT.."MARTEN:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌯︙مرحبا انا بوت اسمي "..NameBot.."\n⌯︙اختصاصي حماية المجموعات\n⌯︙من التفليش والسبام والخخ .. . ،\n⌯︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌯︙سيتم رفع الادمنيه والمنشئ تلقائيا\n⌯︙ارسل امر /free او /play للتمتع باوامر الاعضاء"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
bot_data:setex(XBOT..'MARTEN:Start:Time'..msg.sender_user_id_,1,true)
return false
end 
--     source -𝐗-     --
if not SecondSudo(msg) and not bot_data:sismember(XBOT..'MARTEN:Ban:Pv',msg.sender_user_id_) and not bot_data:get(XBOT..'MARTEN:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=XBoT},function(arg,chat) 
send(msg.sender_user_id_, msg.id_, 1, '⌯︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "SrcX_B0T")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=XBoT,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(XBoT,'⌯︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text =='حظر' or text =='حضر' then
local Text ='⌯︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌯︙تم حظره من التواصل'
SendText(XBoT,Text,msg.id_/2097152/0.5,'md') 
bot_data:sadd(XBOT..'MARTEN:Ban:Pv',data.id_)  
return false  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
local Text ='⌯︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌯︙تم الغاء حظره من التواصل'
SendText(XBoT,Text,msg.id_/2097152/0.5,'md') 
bot_data:srem(XBOT..'MARTEN:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
send(id_user, 0, 1, text, 1, "md")  
Text ='⌯︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID =='MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text ='⌯︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID =='MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text ='⌯︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID =='MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text ='⌯︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID =='MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text ='⌯︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(XBoT, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     source -𝐗-     --
if text and bot_data:get(XBOT..'MARTEN:Start:Bots'..msg.sender_user_id_) then
if text =='الغاء' then   
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الستارت', 1, 'md')
bot_data:del(XBOT..'MARTEN:Start:Bots'..msg.sender_user_id_) 
return false
end
bot_data:set(XBOT.."MARTEN:Start:Bot",text)  
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ كليشة الستارت', 1, 'md')
bot_data:del(XBOT..'MARTEN:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text =='تعيين رسالة الستارت' and ChCheck(msg) or text =='ضع كليشه ستارت' and ChCheck(msg) or text =='↫ تعيين رسالة الستارت ⌯' and ChCheck(msg) then 
bot_data:set(XBOT..'MARTEN:Start:Bots'..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text =='حذف رسالة الستارت' and ChCheck(msg) or text =='حذف كليشه ستارت' and ChCheck(msg) or text =='↫ حذف رسالة الستارت ⌯' and ChCheck(msg) then 
bot_data:del(XBOT..'Start:Bot') 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text =='جلب رسالة الستارت' and ChCheck(msg) or text =='↫ جلب رسالة الستارت ⌯' and ChCheck(msg) then  
local start = bot_data:get(XBOT.."MARTEN:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌯︙مرحبا انا بوت اسمي "..NameBot.."\n⌯︙اختصاصي حماية المجموعات\n⌯︙من التفليش والسبام والخخ .. . ،\n⌯︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌯︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
send(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text =='تفعيل التواصل' and ChCheck(msg) or text =='↫ تفعيل التواصل ⌯' and ChCheck(msg) then   
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل التواصل بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Texting:Pv') 
end
if text =='تعطيل التواصل' and ChCheck(msg) or text =='↫ تعطيل التواصل ⌯' and ChCheck(msg) then  
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل التواصل بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Texting:Pv',true) 
end
if Sudo(msg) then
if text =='تفعيل النسخه التلقائيه' or text =='تفعيل جلب نسخه الكروبات' or text =='تفعيل عمل نسخه للمجموعات' or text =='↫ تفعيل النسخه التلقائيه ⌯' then   
send(msg.chat_id_,msg.id_, 1, "⌯︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌯︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
bot_data:del(XBOT.."MARTEN:Lock:AutoFile")
end
if text =='تعطيل النسخه التلقائيه' or text =='تعطيل جلب نسخه الكروبات' or text =='تعطيل عمل نسخه للمجموعات' or text =='↫ تعطيل النسخه التلقائيه ⌯' then  
send(msg.chat_id_,msg.id_, 1, "⌯︙تم تعطيل جلب نسخة الكروبات التلقائيه\n•-› X", 1, 'md')
bot_data:set(XBOT.."MARTEN:Lock:AutoFile",true) 
end
end
end
--     source -𝐗-     --
if text == "الابراج" or text == "↫ الابراج ⌯" then  send(msg.chat_id_, msg.id_, 1, '⌯︙ من خلال البوت يمكنك معرفه توقعات برجك \n⌯︙ فقط قم بارسال امر برج + اسم البرج \n⌯︙ مثال : برج الاسد ،\n⌯︙ لمعرفه برجك قم بالرجوع الى قسم حساب العمر ', 1, 'md') end
if text == "حساب العمر" or text == "↫ حساب العمر ⌯" then  send(msg.chat_id_, msg.id_, 1, '⌯︙ من خلال البوت يمكنك حساب عمرك \n⌯︙ فقط قم بارسال امر احسب + مواليدك الى البوت \n⌯︙ بالتنسيق التالي مثال : احسب 1997/5/25', 1, 'md') end
if text == "الحمايه" or text == "↫ الحمايه ⌯" then  send(msg.chat_id_, msg.id_, 1, '⌯︙ اضف البوت في المجموعه ثم قم برفعه مشرف وارسل تفعيل \n⌯︙ وتمتع بخدمات غير موجوده في باقي البوتات ', 1, 'md') end
if text == "الزخرفه" or text == "↫ الزخرفه ⌯" then  send(msg.chat_id_, msg.id_, 1, '⌯︙قم بأرسال أمر زخرفه وثم ارسال الاسم الذي تريد زخرفته بألانكليزي أو العربي', 1, 'md') end
if text == "معاني الاسماء" or text == "↫ معاني الاسماء ⌯" then  send(msg.chat_id_, msg.id_, 1, '⌯︙ من خلال البوت يمكنك معرفه معنى اسمك \n⌯︙ فقط قم بارسال امر معنى اسم + الاسم \n⌯︙ مثال : معنى اسم اكس', 1, 'md') end
if text == "عدد المسح" or text == "تعين عدد المسح" or text == "تعيين عدد المسح" then  send(msg.chat_id_, msg.id_, 1, '⌯︙ فقط قم بارسال امر عدد المسح + عدد المسح \n⌯︙ مثال : عدد المسح 100', 1, 'md') end
if text == "انطق" then  send(msg.chat_id_, msg.id_, 1, '⌯︙ فقط قم بارسال امر انطق + الكلمه\n⌯︙سيقوم البوت بنطق الكلمه \n⌯︙ مثال : انطق هلو', 1, 'md') end
--if text == "يوتيوب" and ChCheck(msg) or text == "اليوتيوب" and ChCheck(msg) or text == "↫ بوت اليوتيوب ⌯" and ChCheck(msg) or text == "بوت اليوتيوب" and ChCheck(msg) or text == "اريد بوت يوتيوب" and ChCheck(msg) or text == "شمرلي بوت يوتيوب" and ChCheck(msg) or text == "يوت" and ChCheck(msg) then local inline = {{{text="• اضغط هنا •",url="https://t.me/t_stbot"}}} SendInline(msg.chat_id_,'*⌯︙اضغط للحصول على بوت اليوتيوب*',nil,inline,msg.id_/2097152/0.5) return false end
--if text == "اهمس" and ChCheck(msg) or text == "↫ بوت الهمسه ⌯" and ChCheck(msg) or text == "بوت الهمسه" and ChCheck(msg) or text == "همسه" and ChCheck(msg) or text == "اريد بوت الهمسه" and ChCheck(msg) or text == "دزلي بوت الهمسه" and ChCheck(msg) or text == "دزولي بوت الهمسه" and ChCheck(msg) then  send(msg.chat_id_, msg.id_, 1, '⌯︙@HMSEBOT\n⌯︙@nnbbot\n⌯︙@ocBot\n⌯︙@hebot ', 1, 'md') end
if text == "رابط حذف" or text == "رابط الحذف" or text == "اريد رابط الحذف" or  text == "شمرلي رابط الحذف" or text == "اريد رابط حذف" then
local inline = {{{text="• Telegram •",url="https://my.telegram.org/auth?to=delete"}},{{text="• instagram •",url="https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/"}},{{text="• Facebook •",url="https://www.facebook.com/help/deleteaccount"}},{{text="• Snspchat •",url="https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount"}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} SendInline(msg.chat_id_,'⌯︙رابط الحذف في جميع مواقع التواصل \nفكر قبل لا تتسرع وتروح',nil,inline) return false end
--if text == "↫ بوت الحذف ⌯" and ChCheck(msg) or text == "بوت الحذف" and ChCheck(msg) or text == "اريد بوت الحذف" and ChCheck(msg) or text == "اريد بوت حذف" and ChCheck(msg) or text == "بوت حذف" and ChCheck(msg) or text == "بوت حذف حسابات" and ChCheck(msg) or text == "راح احذف" and ChCheck(msg) then local inline = {{{text="• اضغط هنا •",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'*⌯︙اضغط للحصول على بوت الحذف*',nil,inline,msg.id_/2097152/0.5) return false end
--if text == "↫ بوت الكت ⌯" and ChCheck(msg) or text == "بوت الكت" and ChCheck(msg) or text == "بوت كت" and ChCheck(msg) then local inline = {{{text="• اضغط هنا •",url="https://t.me/E9OBot"}}} SendInline(msg.chat_id_,'*⌯︙اضغط للحصول على بوت الكت*',nil,inline,msg.id_/2097152/0.5) return false end
--if text == "↫ بوت الزخرفه ⌯" and ChCheck(msg) or text == "بوت الزخرفه" and ChCheck(msg) or text == "بوت زخرفه" and ChCheck(msg) then local inline = {{{text="• اضغط هنا •",url="https://t.me/W5555Bot"}}} SendInline(msg.chat_id_,'*⌯︙اضغط للحصول على بوت الزخرفه*',nil,inline,msg.id_/2097152/0.5) return false end
if text == "ايديي" and ChCheck(msg) or text == "↫ ايديي ⌯" and ChCheck(msg) then send(msg.chat_id_, msg.id_, 1,'⌯︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
-- source -𝐗- --
if text =='نبذا' and ChCheck(msg) or text =='↫ نبذا ⌯' then
local XxBOt = {'- Nothing stops him who wants you .','make them wish they had you !.','Maybe a magical girl','٫ 𝖡𝖾 𝗌𝗂𝗆𝗉𝗅𝖾 𝖺𝗇𝖽 𝖽𝗂𝖿𝖿𝖾𝗋𝖾𝗇𝗍','. 𝖬𝖺𝗄𝖾 𝖽𝗋𝖾𝖺𝗆𝗌 𝖿𝗋𝗈𝗆 𝗒𝗈𝗎𝗋 𝗋𝖾𝖿𝗋𝖺𝖼𝗍𝗂𝗈𝗇𝗌 . .',':Life is lying .','𝖨 𝗐𝗂𝗅𝗅 𝖺𝗅𝗐𝖺𝗒𝗌 𝗅𝗈𝗏𝖾 𝗒𝗈𝗎 𝗇𝖾𝗏𝖾𝗋 𝖿𝗈𝗋𝗀𝖾𝗍'}  
send(msg.chat_id_, msg.id_, 1, ''..XxBOt[math.random(#XxBOt)]..'' , 1, 'md')  
return false
end
--     source -𝐗-     --
if text and (text == 'المطور' or text == 'مطور' or text =='↫  المطور ⌯') then
local DevText = bot_data:get(XBOT.."DevText")
if bot_data:get(XBOT.."MARTEN:ChId") then local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..bot_data:get(XBOT.."MARTEN:ChId")) local GetInfo = JSON.decode(Check) 
local DevCh1 = GetInfo.result.username DevCh = '\n⌯︙*D𝐞𝐯 C𝐡* ↬ [@'..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=XBoT},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
local DevName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local FixName = (dp.first_name_):gsub('#','')
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = XBoT,offset_ = 0,limit_ = 1},function(extra,SoOoFi,success) 
if DevText then
if SoOoFi.photos_[0] then
keyboard = {} 
keyboard.inline_keyboard = {{{text='• '..FixName..' •',url=("t.me/"..dp.username_ or "t.me/SrcX_B0T")}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_..'&caption='..URL.escape(DevText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_, 1,'['..DevText..']', 1, "md")
end
else
if SoOoFi.photos_[0] then
local bio = '['..GetBio(dp.id_,msg.chat_id_)..']'
local Text = '⌯︙*D𝐞𝐯 N𝐞𝐦𝐚* ↬ '..DevName..'\n⌯︙*D𝐞𝐯 U𝐬𝐞𝐫* ↬ ['..DevUser..']\n⌯︙*D𝐞𝐯 I𝐝* ↬ ( `'..XBoT..'` )'..DevCh..'\n⌯︙*D𝐞𝐯 B𝐢𝐨* ↬ '..bio..''
keyboard = {} 
keyboard.inline_keyboard = {{{text='• '..FixName..' •',url=("t.me/"..dp.username_ or "t.me/SrcX_B0T")}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_..'&caption='..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_, 1, Text, 1, "md")
end
end
end,nil)
end,nil)
end 
--     source -𝐗-     --
if text == "الميزات الجديده" then
local Text = [[
	⌯︙اليك الميزات الجديده ↫
	⌯︙ميزه جديده وحصريه ↫ كشف الرتب
	• ميزه جديده تضهر جميع رتب المجموعة وعددها
	• يمكنك ايضا حذف الرتب المراد حذفها من خلاله
	⌯︙ تم اضافه ميزه جديده وحصريه 
	• ميزه تاك 
	• اصبح بمكانك عمل تاك محدد لرتب محدده
	⌯︙ ميزه جديده وحصريه ↫ انا او اني او me 
	• قم بارسال الامر ↫ ضع قناتي + معرف قناتك
	• ثم قم بارسال امر اني لروئيه كليشه خاصه بك فقط
	⌯︙تم اضافه ميزه مسح الرتب
	• يمكنك من خلالها مشاهده عدد الرتب 
	• وحذفها جميع الرتب المختارة من خلال الكيبورد
	⌯︙ جميع اوامر البوت اصبحت كيبورد انلاين
	⌯︙ تم اضافه امر الغاء الئ جميع الاوامر علئ شكل كيبورد انلاين
	⌯︙ تم اضافه الميزات الترفيه التاليه
	• اغاني
	• ريمكس
	• مسلسل
	• فلم 
	• ميمز 
	• صوره 
	• متحركه
	⌯︙تم اضافه الاوامر التاليه
	• صورتي
	• نبذا
	⌯︙ امر تفعيل + تعطيل الاوامر التاليه
	• تفعيل تعطيل اضف ردود المطور
	• تفعيل تعطيل حذف ردود المطور 
	• تفعيل تعطيل اضف ردود المدير
	• تفعيل تعطيل حذف ردود المدير
	• تفعيل تعطيل اضف ردود المتعدد
	• تفعيل تعطيل • لجميع الاوامر الترفيه
	• اغاني • ريمكس • مسلسل • فلم ...الخ
	• تفعيل تعطيل كول
	• تفعيل تعطيل غنيلي
	• تفعيل تعطيل الرابط انلاين
	• تفعيل تعطيل الالعاب المتطوره
	• تفعيل تعطيل صورتي
	⌯︙ تم اضافه نوعين الئ الرابط 
	• الرابط نص او رابط كيبورد انلاين
	⌯︙اضافه كيبورد الئ ترحيب البوت 
	• يحتوي كل من الاوامر 
	• تفعيل • غادر • ترتيب الاوامر • تعطيل • رفع الادمنيه
	⌯︙ تم اصلاح بعض الاخطاء مثل
	• تم تطوير كليشه المطور والمنشئ بشكل تام اصبحت تضهر مهما كان
	• حذف الردود المطور تم حل المشكله
	• الزخرفه
	⌯︙تم اضافه اوامر خدمية في خاص البوت
	⌯︙ تم اضافه اوامر جديده الاوامر النسب
	• نسبه الغباء • نسبه الخيانه
	⌯︙ تم اضافه اوامر جديده الئ الاوامر
	• اوامر التفعيل والتعطيل
	• اوامر القفل والفتح 
	• اوامر الرتب
	⌯︙ تم اضافه ميزه تحكم
	• من خلاله يمكنك عمل رد علئ المستخدم 
	• والتحكم به كالحظر والطرد والكتم والتقيد 
	• ورفع رتبه وتنزيل رتبه 
	⌯︙ اوامر جديده لرفع الرتب
	• رفع رتبه بالرد
	• تنزيل رتبه بالرد
	⌯︙ اضافه رتبه جديده
	• رفع تنزيل مطور اساسي
	• ارجاع رتبه المالك
	⌯︙ تم تعزيز الحماية بالاشعارات الاتيه
	• عند قفل الدردشه او المتحركه او الرابط .. الخ 
	• يقوم بالبوت بارسال اشعار تنبيه للشخص المخالف
	• عند قفل الروابط الان لا يستطيع المميز ارسال رابط
	⌯︙تم تطور ميزه امسح واصبحت كيبورد انلاين
	⌯︙ تم فصل كود التنظيف التلقائي عن امسح
	• تم وضع الرينج بالحذف التلقائي من 10 الئ 2000 من الميديا 
	⌯︙ مسح قائمه المنع
	• اصبح المسح الان محدد من خلال الكيبورد 
	⌯︙ تم اضافه اوامر اخرئ الئ امر ترتيب الاوامر
	قم بمتابعة قناة التحديثات 
	لمشاهدة جميع تحديثات اكس اول باول
]]
local inline = {
	{{text="قناة تحديثات اكس",url="t.me/FIDRG"}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text == "معرفي" or text == "↫  معرفي ⌯" then
function get_username(extra,result,success)
text ='⌯︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" or text == "↫  اسمي ⌯" then
function get_firstname(extra,result,success)
text ='⌯︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end 
if text == "تفعيل نبذتي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر نبذتي بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Bio:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل نبذتي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر نبذتي بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Bio:MARTEN'..msg.chat_id_,true)  
end
if text =='نبذتي' or text =='بايو' or text =='↫  نبذتي ⌯' then
if not bot_data:get(XBOT..'MARTEN:Bio:MARTEN'..msg.chat_id_) then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end end
if text == "صورتي" or text == "↫ صورتي ⌯" then
local my_ph = bot_data:get(XBOT.."MARTEN:Photo:Profile"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," ⌯︙الصوره معطله") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," ⌯︙عدد صورك ↫ "..result.total_count_.." صوره‌‏", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
--     source -𝐗-     --
if text and (text:match("^ضع قناتي (.*)$") or text:match("^وضع قناتي (.*)$")) and ChCheck(msg) then
local MARTEN = text:match("^ضع قناتي (.*)$") or text:match("^وضع قناتي (.*)$") 
bot_data:set(XBOT..'MARTEN:Channel:Vip'..msg.sender_user_id_,MARTEN)
local Text = "⌯︙تم حفظ قناتك"
local inline = {
	{{text="• الغاء •",callback_data="/DelChannelVip:"..msg.sender_user_id_}},
	{{text="• اخفاء •",callback_data="/HideChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
return false   
end
if text == "حذف قناتي" then
if not bot_data:get(XBOT..'MARTEN:Channel:Vip'..msg.sender_user_id_) then
Text = "⌯︙انت لم تقم بـ وضع قناتك"
local inline = {
	{{text="• وضع قناتي •",callback_data="/ChangeChannelVip:"..msg.sender_user_id_}},
	{{text="• اخفاء •",callback_data="/HideChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
return false
else
bot_data:del(XBOT..'MARTEN:Channel:Vip'..msg.sender_user_id_)
Text = "⌯︙تم حذف قناتك بنجاح"
local inline = {
	{{text="• وضع قناتي •",callback_data="/ChangeChannelVip:"..msg.sender_user_id_}},
	{{text="• اخفاء •",callback_data="/HideChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
return false
end
end
--     source -𝐗-     --
if text and (text =='1اضف قناتي' or text =='1اضافه قناتي' or text =='1وضع قناتي' or text =='1ضع قناتي') and ChCheck(msg) then
bot_data:set(XBOT..'MARTEN:Channel:Vip'..msg.sender_user_id_,'SetChannelVip')
local text = "⌯︙حسنا ارسل لي الان القناة"
local inline = {
	{{text="• الغاء •",callback_data="/CancelChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
return false
end 
--     source -𝐗-     --
if bot_data:get(XBOT..'SetChannelVip'..msg.sender_user_id_) then 
if text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ قناتك ', 1, 'md')
bot_data:del(XBOT..'SetChannelVip'..msg.sender_user_id_)
return false  
end 
bot_data:del(XBOT..'SetChannelVip'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Channel:Vip'..msg.sender_user_id_,text)
local text = "⌯︙تم حفظ قناتك"
local inline = {
	{{text="• تغيير قناتي •",callback_data="/ChangeChannelVip:"..msg.sender_user_id_},{text="• حذف قناتي •",callback_data="/DelChannelVip:"..msg.sender_user_id_}},
	{{text="• اخفاء •",callback_data="/HideChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
return false   
end
if text and text:match("^ضع قناتي$") and ChCheck(msg) or text and text:match("^وضع قناتي$") and ChCheck(msg) then
local text = "⌯︙حسنا ارسل لي قناتك الان"
local inline = {
	{{text="• الغاء •",callback_data="/CancelChannelVip:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
bot_data:set(XBOT..'SetChannelVip'..msg.sender_user_id_,true)
return false
end
if text and text:match("^قناتي$") and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Channel:Vip'..msg.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, "⌯︙لم تقم باضافة قناتك\n⌯︙قم بارسال وضع قناتي", 1, nil)
else
local rules = bot_data:get(XBOT..'MARTEN:Channel:Vip'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
end
--     source -𝐗-     --
if text == "me" or text == "انا" or text == "اني" or text == "منو اني" or text == "من انا" or text == "↫ من انا ⌯" then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:ME'..msg.chat_id_) then 
return false
end
if not bot_data:get(XBOT.."MARTEN:Channel:Vip"..msg.sender_user_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙انت لم تقم باضافة قناتك مسبقاَ\n⌯︙قم بأرسال ↫  ضع قناتي + معرف قناتك\n⌯︙ثم أرسل الامر ↫ انا\n•-› X")  
else
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
local DevName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local Text = GetBio(msg.sender_user_id_)
local function getpro(extra, result, success)
if result.photos_[0] then
MARTEN = result.photos_[0].sizes_[1].photo_.persistent_id_
local FixName = (dp.first_name_):gsub('#','')
local FixChannel = (bot_data:get(XBOT.."MARTEN:Channel:Vip"..msg.sender_user_id_) or "SrcX_B0T")
local bot_data = FixChannel:gsub('@','')
keyboard = {}  
keyboard.inline_keyboard = {
	{{text="•  "..FixName.." •",url=("t.me/"..dp.username_ or "t.me/SrcX_B0T")}},
	{{text="• قناتي •",url="t.me/"..bot_data}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
} 
local msg_id = msg.id_/2097152/0.5 
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo='..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end,nil)
end
end
--     source -𝐗-     --
if text == "الالعاب المتطوره" or text == "الالعاب الاحترافيه" or text == "↫ الالعاب المتطوره ⌯" then if not bot_data:get(XBOT..'MARTEN:Lock:Gamesinline'..msg.chat_id_) then local inline = {{{text="• ♟ الشطرنج ♟ •",url='https://t.me/T4TTTTBOT?game=chess'}},{{text="• لعبة فلابي بيرد 🐥 •",url='https://t.me/awesomebot?game=FlappyBird'},{text="• تحدي الرياضيات •",url='https://t.me/gamebot?game=MathBattle'}},{{text="• اكس او •",url='t.me/xobot?start'},{text="• سباق الدراجات 🏍 •",url='https://t.me/gamee?game=MotoFX'}},{{text="• سباق سيارات 🏎 •",url='https://t.me/gamee?game=F1Racer'},{text="• متشابه 👾 •",url='https://t.me/gamee?game=DiamondRows'}},{{text="• كرة قدم ⚽ •",url='https://t.me/gamee?game=FootballStar'}},{{text="• ورق🤹‍♂ •",url='https://t.me/gamee?game=Hexonix'},{text="• Hexonix❌ •",url='https://t.me/gamee?game=Hexonix'}},{{text="• MotoFx🏍️ •",url='https://t.me/gamee?game=MotoFx'}},{{text="• لعبة 2048 🎰 •",url='https://t.me/awesomebot?game=g2048'},{text="• Squares🏁 •",url='https://t.me/gamee?game=Squares'}},{{text="• Atomic 1▶️ •",url='https://t.me/gamee?game=AtomicDrop1'},{text="• Corsairs •",url='https://t.me/gamebot?game=Corsairs'}},{{text="• LumberJack •",url='https://t.me/gamebot?game=LumberJack'}},{{text="• LittlePlane •",url='https://t.me/gamee?game=LittlePlane'},{text="• RollerDisco •",url='https://t.me/gamee?game=RollerDisco'}},{{text="• 🦖 لعبة التنين 🦖 •",url='https://t.me/T4TTTTBOT?game=dragon'},{text="• 🐍 لعبة الافعى 🐍 •",url='https://t.me/T4TTTTBOT?game=snake'}},{{text="• 🔵 لعبة الالوان 🔴 •",url='https://t.me/T4TTTTBOT?game=color'}},{{text="• 🚀 لعبة الصاروخ 🚀 •",url='https://t.me/T4TTTTBOT?game=rocket'},{text="• 🏹 لعبة السهام 🏹 •",url='https://t.me/T4TTTTBOT?game=arrow'}},{{text="• لعبة النينجا •",url='https://t.me/gamee?game=GravityNinja21'},{text="• لعبة الكرتي •",url='https://t.me/gamee?game=KarateKid2'}},{{text='• TeAm XBOT •', url="t.me/SrcX_B0T"}}} SendInline(msg.chat_id_,'*⌯︙قائمه الالعاب المتطوره اضغط للعب*',nil,inline,msg.id_/2097152/0.5) return false end end
--     source -𝐗-     --
if text and text:match("^غادر (-%d+)$")  then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
send(msg.chat_id_, msg.id_, 1, "⌯︙المجموعه ↫ ["..dp.title_.."]\n⌯︙تمت المغادره منها بنجاح", 1, "md")
send(Text[2], 0, 1, "⌯︙بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, XBOT)
bot_data:srem(XBOT.."MARTEN:Groups", dp.id_)
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     source -𝐗-     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
bot_data:incr(XBOT..'MARTEN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
bot_data:set(XBOT.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = bot_data:get(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not Admin(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not Admin(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not Admin(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not Admin(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not Admin(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not Admin(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(XBOT) then 
bot_data:srem(XBOT.."MARTEN:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(XBoT,"⌯︙تم طرد البوت من المجموعه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID =='MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID =='MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
bot_data:incr(XBOT..'MARTEN:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
bot_data:incr(XBOT..'MARTEN:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     source -𝐗-     --
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:FreeBot'..XBOT) then
if ChatType =='pv' then
send(msg.chat_id_, msg.id_, 1, '⌯︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~='sp' then
send(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_, 1, '⌯︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status ='منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status ='ادمن'
else 
status ='عضو'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoFi) 
local admins = SoFi.members_
for i=0 , #admins do
if SoFi.members_[i].bot_info_ == false and SoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if SoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then
bot_data:sadd(XBOT.."MARTEN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
bot_data:sadd(XBOT.."MARTEN:MARTENConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT.."MARTEN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
bot_data:srem(XBOT.."MARTEN:MARTENConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if bot_data:sismember(XBOT..'MARTEN:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(bot_data:get(XBOT..'MARTEN:Num:Add:Bot') or 0) and not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙عدد اعضاء المجموعه اقل من ↫ *'..(bot_data:get(XBOT..'MARTEN:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","⌯︙تم تفعيل المجموعه "..dp.title_)  
bot_data:sadd(XBOT.."MARTEN:Groups",msg.chat_id_)
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup ='لا يوجد'
end
bot_data:set(XBOT.."MARTEN:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(XBoT,"⌯︙تم تفعيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙موقعه في المجموعه ↫ "..status.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     source -𝐗-     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
bot_data:set(XBOT..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     source -𝐗-     --
local ReFalse = tostring(msg.chat_id_)
if not bot_data:sismember(XBOT.."MARTEN:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     source -𝐗-     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if bot_data:get(XBOT..'MARTEN:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, dp.id_)
local Text ='⌯︙اهلا عزيزي ↫ ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\n⌯︙يجب علينا التأكد أنك لست روبوت\n⌯︙تم تقيدك اضغط الزر بالاسفل لفكه'
local inline = {{{text="• اضغط هنا لفك تقيدك •",callback_data="/UnTkeed"}}} 
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
return false
end
if bot_data:get(XBOT.."MARTEN:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Bot(msg) then 
local filter = bot_data:smembers(XBOT.."MARTEN:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Bot(msg) then 
local filter = bot_data:smembers(XBOT.."MARTEN:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Bot(msg) then 
local filter = bot_data:smembers(XBOT.."MARTEN:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     source -𝐗-     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = bot_data:get(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = bot_data:get(XBOT..'MARTEN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods =='DelGpRedRedods' then
send(msg.chat_id_, msg.id_, 1,'⌯︙الرد ↫ '..msg.content_.text_..' للكلمه ↫ '..GetGpTexts..' تم حذفها',  1, "html")
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
bot_data:srem(XBOT..'MARTEN:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = bot_data:get(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed =='DelGpRedod' then
send(msg.chat_id_, msg.id_, 1,'⌯︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
bot_data:srem(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = bot_data:get(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed =='DelGpRed' then
send(msg.chat_id_, msg.id_, 1,'⌯︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
bot_data:del(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Video:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:File:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:GpRed'..msg.content_.text_..msg.chat_id_)
bot_data:srem(XBOT..'MARTEN:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(XBOT.."MARTEN:Sudo:AllRed"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, 1,'⌯︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
list = {"MARTEN:Audio:AllRed","MARTEN:File:AllRed","MARTEN:Video:AllRed","MARTEN:Photo:AllRed","MARTEN:Text:AllRed","MARTEN:Stecker:AllRed","MARTEN:Voice:AllRed","MARTEN:Gif:AllRed"}
for k,v in pairs(list) do
bot_data:del(XBOT..''..v..text)
end
bot_data:del(XBOT.."MARTEN:Sudo:AllRed"..msg.sender_user_id_..":"..msg.chat_id_)
bot_data:srem(XBOT.."MARTEN:Sudo:AllRed", text)
return false
end
end
--     source -𝐗-     --
if text and text:match("^(.*)$") then
local SaveGpRedod = bot_data:get(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod =='SaveGpRedod' then
local GetGpTexts = bot_data:get(XBOT..'MARTEN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = bot_data:smembers(XBOT..'MARTEN:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, 1, "⌯︙⌯︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:GpTexts'..GetGpTexts..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
bot_data:srem(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
bot_data:sadd(XBOT..'MARTEN:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ ↫ 5 من الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local MARTEN = "⌯︙تم حفظ الرد رقم ↫ "..(#List+1).."\n⌯︙قم بارسال الرد رقم ↫ "..(#List+2)
local inline = {{{text="• انهاء وحفظ "..(#List+1).." من الردود •",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="• الغاء وحذف التخزين •",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
SendInline(msg.chat_id_,MARTEN,nil,inline)
return false
end
end
if text and not bot_data:get(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if bot_data:sismember(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_,text) then
local XxBOt =  bot_data:smembers(XBOT..'MARTEN:Text:GpTexts'..text..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '['..XxBOt[math.random(#XxBOt)]..']' , 1, 'md')  
end
end
--     source -𝐗-     --
if text and text:match("^(.*)$") then
local SaveKt = bot_data:get(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
if SaveKt =='SaveKt' then
local GetKtTexts = bot_data:get(XBOT..'MARTEN:Add:KtTexts'..msg.sender_user_id_..msg.chat_id_)
local List = bot_data:smembers(XBOT..'MARTEN:Text:KtTexts'..GetKtTexts..msg.chat_id_)
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, 1, "⌯︙⌯︙تم الغاء عملية حفظ اسئلة الكت  ↫ "..GetKtTexts ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:KtTexts'..GetKtTexts..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Add:KtTexts'..msg.sender_user_id_..msg.chat_id_)
bot_data:srem(XBOT..'MARTEN:Sudo:Kt'..msg.chat_id_,GetKtTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
bot_data:sadd(XBOT..'MARTEN:Text:KtTexts'..GetKtTexts..msg.chat_id_,Text)
if #List == 100 then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ ↫ 100 من اسئلة الكت ↫ "..GetKtTexts ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
return false
end
local MARTEN = "⌯︙تم حفظ الرد رقم ↫ "..(#List+1).."\n⌯︙قم بارسال السؤال رقم ↫ "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="• انهاء وحفظ "..(#List+1).." من الاسئله •",callback_data="/EndKt:"..msg.sender_user_id_..GetKtTexts}},{{text="• الغاء وحذف التخزين •",callback_data="/DelAllKt:"..msg.sender_user_id_..GetKtTexts}}} 
SendInline(msg.chat_id_,nil,inline,msg.id_/2097152/0.5)
return false
end
end
if text and not bot_data:get(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_) then
if bot_data:sismember(XBOT..'MARTEN:Sudo:Kt'..msg.chat_id_,text) then
local XxBOt =  bot_data:smembers(XBOT..'MARTEN:Text:KtTexts'..text..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '['..XxBOt[math.random(#XxBOt)]..']' , 1, 'md')  
end
end
--     source -𝐗-     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = bot_data:get(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed =='SaveGpRed' then 
if text =='الغاء' then
local DelManagerRep = bot_data:get(XBOT..'DelManagerRep'..msg.chat_id_)
bot_data:srem(XBOT..'MARTEN:Manager:GpRed'..msg.chat_id_,DelManagerRep)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ الرد', 1, 'md')
bot_data:del(XBOT..'MARTEN:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
bot_data:del(XBOT..'DelManagerRep'..msg.chat_id_)
return false
end
bot_data:del(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = bot_data:get(XBOT..'MARTEN:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then bot_data:set(XBOT..'MARTEN:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then bot_data:set(XBOT..'MARTEN:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then bot_data:set(XBOT..'MARTEN:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then bot_data:set(XBOT..'MARTEN:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then bot_data:set(XBOT..'MARTEN:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
bot_data:set(XBOT..'MARTEN:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then bot_data:set(XBOT..'MARTEN:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
bot_data:set(XBOT..'MARTEN:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الرد الجديد', 1, 'md') 
bot_data:del(XBOT..'MARTEN:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
bot_data:del(XBOT..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not bot_data:get(XBOT..'MARTEN:Lock:GpRed'..msg.chat_id_) then 
if bot_data:get(XBOT..'MARTEN:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, bot_data:get(XBOT..'MARTEN:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if bot_data:get(XBOT..'MARTEN:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, bot_data:get(XBOT..'MARTEN:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if bot_data:get(XBOT..'MARTEN:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT..'MARTEN:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if bot_data:get(XBOT..'MARTEN:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT..'MARTEN:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if bot_data:get(XBOT..'MARTEN:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT..'MARTEN:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if bot_data:get(XBOT..'MARTEN:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT..'MARTEN:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if bot_data:get(XBOT..'MARTEN:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, bot_data:get(XBOT..'MARTEN:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if bot_data:get(XBOT..'MARTEN:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function XxBOt(extra,result,success)
if result.username_ then username ='[@'..result.username_..']' else username ='لا يوجد' end
local edit_msg = bot_data:get(XBOT..'MARTEN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = bot_data:get(XBOT..'MARTEN:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local Text = Text:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
send(msg.chat_id_, msg.id_,'['..Text..']')
end
getUser(msg.sender_user_id_, XxBOt)
end
end
--     source -𝐗-     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = bot_data:get(XBOT.."MARTEN:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed =='SaveAllRed' then
if text =='الغاء' then
local DelSudoRep = bot_data:get(XBOT..'DelSudoRep')
bot_data:del(XBOT.."MARTEN:Sudo:AllRed",DelSudoRep)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ الرد', 1, 'md')
bot_data:del(XBOT.."MARTEN:Add:AllText"..msg.sender_user_id_)
bot_data:del(XBOT.."MARTEN:Add:AllRed"..msg.sender_user_id_)
bot_data:del(XBOT.."DelSudoRep")
return false
end
bot_data:del(XBOT.."MARTEN:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = bot_data:get(XBOT.."MARTEN:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
bot_data:set(XBOT.."MARTEN:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
bot_data:set(XBOT.."MARTEN:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
bot_data:set(XBOT.."MARTEN:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
bot_data:set(XBOT.."MARTEN:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
bot_data:set(XBOT.."MARTEN:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
bot_data:set(XBOT.."MARTEN:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
bot_data:set(XBOT.."MARTEN:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
bot_data:set(XBOT.."MARTEN:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الرد الجديد', 1, 'md') 
bot_data:del(XBOT.."MARTEN:Add:AllText"..msg.sender_user_id_)
bot_data:del(XBOT..'DelSudoRep')
return false end end
if msg.content_.text_ and not bot_data:get(XBOT..'MARTEN:Lock:AllRed'..msg.chat_id_) then
if bot_data:get(XBOT.."MARTEN:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, bot_data:get(XBOT.."MARTEN:Video:AllRed"..msg.content_.text_))
end
if bot_data:get(XBOT.."MARTEN:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, bot_data:get(XBOT.."MARTEN:File:AllRed"..msg.content_.text_))
end
if bot_data:get(XBOT.."MARTEN:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT.."MARTEN:Voice:AllRed"..msg.content_.text_))
end
if bot_data:get(XBOT.."MARTEN:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT.."MARTEN:Audio:AllRed"..msg.content_.text_))
end
if bot_data:get(XBOT.."MARTEN:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT.."MARTEN:Photo:AllRed"..msg.content_.text_))
end
if  bot_data:get(XBOT.."MARTEN:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, bot_data:get(XBOT.."MARTEN:Gif:AllRed"..msg.content_.text_))
end
if bot_data:get(XBOT.."MARTEN:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, bot_data:get(XBOT.."MARTEN:Stecker:AllRed"..msg.content_.text_))
end
if bot_data:get(XBOT.."MARTEN:Text:AllRed"..msg.content_.text_) then
function XxBOt(extra,result,success)
if result.username_ then username ='[@'..result.username_..']' else username ='لا يوجد' end
local edit_msg = bot_data:get(XBOT..'MARTEN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = bot_data:get(XBOT.."MARTEN:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local Text = Text:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
send(msg.chat_id_, msg.id_,'['..Text..']')
end
getUser(msg.sender_user_id_, XxBOt)
end
end 
--     source -𝐗-     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName ='['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text ='⌯︙العضو ↫ '..GetName..' \n⌯︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not bot_data:sismember(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text ='⌯︙العضو ↫ '..GetName..' \n⌯︙قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_, msg.sender_user_id_) then
bot_data:sadd(XBOT..'MARTEN:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text ='⌯︙العضو ↫ '..GetName..' \n⌯︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions XBOT --
--     source -𝐗-     --
--       Spam Check       --
if not Admin(msg) and msg.content_.ID ~= "MessageChatAddMembers" and bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= XBOT then
floods = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(bot_data:get(XBOT.."MARTEN:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
bot_data:setex(XBOT.."MARTEN:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     source -𝐗-     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(XBOT) then
bot_data:set(XBOT..'MARTEN:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = bot_data:get(XBOT..'MARTEN:PinnedMsg'..msg.chat_id_)
if pin_id and bot_data:get(XBOT..'MARTEN:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if bot_data:get(XBOT..'MARTEN:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
bot_data:del(XBOT..'MARTEN:viewget'..msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
bot_data:del(XBOT..'MARTEN:viewget'..msg.sender_user_id_)
end
end
--     source -𝐗-     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال الصور هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if bot_data:get(XBOT..'MARTEN:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال ماركداون هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     source -𝐗-     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال ملفات هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال انلاين هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     source -𝐗-     --
--        Sticker         --
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال ملصقات هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if bot_data:get(XBOT..'MARTEN:Groups:Welcomes'..msg.chat_id_) then
Welcomes = bot_data:get(XBOT..'MARTEN:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@SrcX_B0T]'))
send(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if bot_data:get(XBOT.."MARTEN:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     source -𝐗-     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not bot_data:get(XBOT..'MARTEN:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = XBOT,offset_ = 0,limit_ = 1},function(extra,SoFi,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(XBOT) then 
if bot_data:sismember(XBOT..'MARTEN:Groups',msg.chat_id_) then BotText = "مفعله في السابق\n⌯︙ارسل ↫ الاوامر واستمتع بالمميزيات" else BotText = "معطله يجب رفعي مشرف\n⌯︙بعد ذلك يرجى ارسال امر ↫ تفعيل\n⌯︙سيتم رفع الادمنيه والمنشئ تلقائيا" end 
if bot_data:get(XBOT.."MARTEN:Text:BotWelcome") then MARTENText = bot_data:get(XBOT.."MARTEN:Text:BotWelcome") else MARTENText = "⌯︙مرحبا انا بوت اسمي "..NameBot.."\n⌯︙حالة المجموعه ↫ "..BotText.."\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ" end 
if bot_data:get(XBOT.."MARTEN:Photo:BotWelcome") then MARTENPhoto = bot_data:get(XBOT.."MARTEN:Photo:BotWelcome") elseif SoFi.photos_[0] then MARTENPhoto = SoFi.photos_[0].sizes_[1].photo_.persistent_id_ else MARTENPhoto = nil end 
if MARTENPhoto ~= nil then
keyboard = {} 
keyboard.inline_keyboard = {
	{{text="• غادر •",callback_data="/LeaveBotPic:"..msg.sender_user_id_},{text="• تفعيل •",callback_data="/OnPic:"..msg.sender_user_id_}},
	{{text = 'سـوࢪس أڪـس  メ', url="t.me/SrcX_B0T"}},
}
local msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..MARTENPhoto..'&caption=' .. URL.escape(MARTENText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))

--sendPhoto(msg.chat_id_,msg.id_,0,1,nil,MARTENPhoto,MARTENText)
else 
send(msg.chat_id_,msg.id_,MARTENText)
end 
end   
end
end,nil)
end
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if bot_data:get(XBOT.."MARTEN:Lock:Welcome"..msg.chat_id_) then
if bot_data:get(XBOT..'MARTEN:Groups:Welcomes'..msg.chat_id_) then
Welcomes = bot_data:get(XBOT..'MARTEN:Groups:Welcomes'..msg.chat_id_)
else
Welcomes ='• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@SrcX_B0T]'))
send(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     source -𝐗-     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     source -𝐗-     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال اغاني هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال الصوت هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال موقع هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال فيديو هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if bot_data:get(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال متحركه هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     source -𝐗-     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع توجيه الرسائل هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) and not Admin(msg) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال روابط\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال رسائل الدردشة مقفوله\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال تاك هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال هاشتاك هنا\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" and not Admin(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if not VipMem(msg) then
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙العربيه مقفوله\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not bot_data:get(XBOT..'MARTEN:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(bot_data:get(XBOT..'MARTEN:Spam:Text'..msg.chat_id_))
end
if bot_data:get(XBOT..'MARTEN:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع ارسال الكلايش\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙الانكليزيه مقفوله\n•-› X")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     source -𝐗-     --
if bot_data:get(XBOT.."MARTEN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"⌯︙تم الغاء حفظ الرابط")       
bot_data:del(XBOT.."MARTEN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
bot_data:set(XBOT.."MARTEN:Groups:Links"..msg.chat_id_,Link)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الرابط بنجاح', 1, 'md')
bot_data:del(XBOT.."MARTEN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     source -𝐗-     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if bot_data:get('XxBOt:'..XBOT.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
bot_data:del('XxBOt:'..XBOT..'id:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
bot_data:del('XxBOt:'..XBOT.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
bot_data:del('XxBOt:'..XBOT.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = bot_data:get('XxBOt:'..XBOT..'id:user'..msg.chat_id_)  
bot_data:incrby(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
send(msg.chat_id_, msg.id_,  1, "⌯︙تم اضافة "..numadded..' رساله', 1, 'md')
bot_data:del('XxBOt:'..XBOT..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if bot_data:get('XxBOt:'..XBOT.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
bot_data:del('XxBOt:'..XBOT..'ids:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
bot_data:del('XxBOt:'..XBOT.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
bot_data:del('XxBOt:'..XBOT.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = bot_data:get('XxBOt:'..XBOT..'ids:user'..msg.chat_id_)  
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, "⌯︙تم اضافة "..numadded..' نقطه', 1, 'md')
bot_data:del('XxBOt:'..XBOT..'ids:user'..msg.chat_id_)  
end
end
--     source -𝐗-     --
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not bot_data:get(XBOT.."MARTEN:Lock:Fshar"..msg.chat_id_) and not BasicConstructor(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع الفشار في المجموعه \n⌯︙تأدب شوية عيب\n 😡")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if bot_data:get(XBOT.."MARTEN:Lock:Farsi"..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع التكلم بالغه الفارسيه هنا\n⌯︙لتصير ذيل\n❤️ 🇮🇶")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if bot_data:get(XBOT.."MARTEN:Lock:FarsiBan"..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not bot_data:get(XBOT.."MARTEN:Lock:Kfr"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع الكفر في المجموعه\n⌯︙استغفر ربك\n*استغفر الله العلي العظيم*") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not bot_data:get(XBOT.."MARTEN:Lock:Taf"..msg.chat_id_) and not BasicConstructor(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع التكلم بالطائفيه هنا\n*⌯︙اخوان سنة وشيعة*\n ❤️") 
end end
--     source -𝐗-     --
if SecondSudo(msg) then
if text =='جلب نسخه الكروبات' or text =='جلب نسخه احتياطيه' or text =='جلب النسخه الاحتياطيه' or text =='↫ جلب نسخه احتياطيه ⌯' then
local List = bot_data:smembers(XBOT..'MARTEN:Groups') 
local Users = bot_data:smembers(XBOT..'MARTEN:Users') 
local BotName = (bot_data:get(XBOT.."MARTEN:NameBot") or 'اكس')
local GetJson ='{"BotId": '..XBOT..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = bot_data:get(XBOT.."MARTEN:Groups:Links"..v)
Welcomes = bot_data:get(XBOT..'MARTEN:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
MARTENConstructors = bot_data:smembers(XBOT..'MARTEN:MARTENConstructor:'..v)
Constructors = bot_data:smembers(XBOT..'MARTEN:BasicConstructor:'..v)
BasicConstructors = bot_data:smembers(XBOT..'MARTEN:Constructor:'..v)
Managers = bot_data:smembers(XBOT..'MARTEN:Managers:'..v)
Admis = bot_data:smembers(XBOT..'MARTEN:Admins:'..v)
Vips = bot_data:smembers(XBOT..'MARTEN:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #User ~= 0 then 
GetJson = GetJson..'"Users":['
for k,v in pairs(Users) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #MARTENConstructors ~= 0 then
GetJson = GetJson..'"MARTENConstructors":['
for k,v in pairs(MARTENConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..XBOT..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..XBOT..'.json', '⌯︙يحتوي الملف على ↫ ⤈\n    • على ↫ '..#List..' مجموعه\n    • وايضاَ ↫ '..#Users..' مشترك\n•-› ✓' ,dl_cb, nil)
io.popen('rm -rf ./'..XBOT..'.json')
end
if text and (text =='رفع النسخه' or text =='رفع النسخه الاحتياطيه' or text =='رفع نسخه الاحتياطيه') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text =='رفع ملف السورس' or text =='رفع الملف' and Sudo(msg) and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFileSource(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
--     source -𝐗-     --
if bot_data:get(XBOT.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
send( msg.chat_id_, msg.id_, 1,"⌯︙يوجد فقط ( 6 ) اختيارات\n⌯︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = bot_data:get(XBOT.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
bot_data:del(XBOT.."SET:GAME"..msg.chat_id_)   
send( msg.chat_id_, msg.id_, 1,'⌯︙*المحيبس باليد رقم* ↫ '..NUM..'\n⌯︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
bot_data:del(XBOT.."SET:GAME"..msg.chat_id_)   
send( msg.chat_id_, msg.id_, 1,'⌯︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n⌯︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if bot_data:get(XBOT..'bot_data4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "⌯︙تم الغاء الامر")
bot_data:del(XBOT..'bot_data4'..msg.sender_user_id_)
return false  end 
bot_data:del(XBOT..'bot_data4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '⌯︙المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID =='PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '⌯︙عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '⌯︙عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID =='ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'⌯︙البوت ادمن في القناة \n⌯︙تم تفعيل الاشتراك الاجباري \n⌯︙ايدي القناة ↫ '..data.id_..'\n⌯︙معرف القناة ↫ [@'..data.type_.channel_.username_..']')
bot_data:set(XBOT..'MARTEN:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'⌯︙عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     source -𝐗-     --
if bot_data:get(XBOT.."MARTEN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
bot_data:del(XBOT.."MARTEN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
return false 
end 
bot_data:del(XBOT.."MARTEN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
bot_data:set(XBOT.."DevText", DevText)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ كليشة المطور", 1, "md")
end
if bot_data:get(XBOT..'MARTEN:NameBot'..msg.sender_user_id_) =='msg' then
if text and text:match("^الغاء$") then 
bot_data:del(XBOT..'MARTEN:NameBot'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
return false 
end 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ اسم البوت ', 1, 'html')
bot_data:del(XBOT..'MARTEN:NameBot'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:NameBot', text)
return false 
end
--     source -𝐗-     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
bot_data:incr(XBOT..'MARTEN:UsersMsgs'..XBOT..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
bot_data:incr(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
bot_data:incr(XBOT..'MARTEN:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType ='sp' 
elseif id:match("^(%d+)") then
if not bot_data:sismember(XBOT.."MARTEN:Users",msg.chat_id_) then
bot_data:sadd(XBOT.."MARTEN:Users",msg.chat_id_)
end
ChatType ='pv' 
else
ChatType ='gp' 
end
end 
--     source -𝐗-     --
if ChatType =='sp' or ChatType =='gp' or ChatType =='pv' then
if text == 'بوت' or text == 'بوتت' then 
local XxBot = {"❤️‍🔥","🏌🏼","🦋","🍧","🥲","🍇","🥲♥️","♥️","🍧🍇",""} 
local XBoT = XxBot[math.random(#XxBot)]
NameBot = (bot_data:get(XBOT..'MARTEN:NameBot') or 'اكس')
local XxBOt = {
    "لتڪول بۅٛت اسَميہ "..NameBot.." "..XBoT.."",
    "اسميہ ألقمـيل "..NameBot.." "..XBoT.."",
    "• عنديہ آسم ترۿ "..XBoT.."",
    "صـيحوليہ "..NameBot.." ڪـآآفي بۅٛت "..XBoT.."",
    "أنتهہ ألبۅٛت ݪڪك "..XBoT.."",
    "شتࢪيَد ضَݪـ؏ـييہ "..XBoT.."",
    "ههآآه يـڕﯢحٰ "..NameBot.." "..XBoT.."",
} 
bot_data2 = math.random(#XxBOt) 
send(msg.chat_id_, msg.id_, 1, XxBOt[bot_data2] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
local XxBot = {"❤️‍🔥","🏌🏼","🦋","🍧","🥲","🍇","🥲♥️","♥️","🍧🍇",""} 
local XBoT = XxBot[math.random(#XxBot)]
NameBot = (bot_data:get(XBOT..'MARTEN:NameBot') or 'اكس') 
local XxBOt = {
    "آسميہ ألقمـيل "..NameBot.." "..XBoT.."",
    'ڪول - حبيبي اﻧـييہ '..NameBot..' '..XBoT..'',
    "هلآآ ؏ـمـريـہٰ. وياڪك "..NameBot.." "..XBoT..""
} 
bot_data2 = math.random(#XxBOt) 
send(msg.chat_id_, msg.id_, 1, XxBOt[bot_data2] , 1, 'html') 
return false
end
if text and text == (bot_data:get(XBOT..'MARTEN:NameBot') or 'اكس') then 
local XxBot = {"❤️‍🔥","🏌🏼","🦋","🍧","🥲","🍇","🥲♥️","♥️","🍧🍇",""} 
local XBoT = XxBot[math.random(#XxBot)]
NameBot = (bot_data:get(XBOT..'MARTEN:NameBot') or 'اكس')
local namebot = {
    'هلآآ ڪـلبي وياڪك '..NameBot..' تفضـࢦ'..XBoT..'',
    'تࢪۿ مَصختَها آحچيَ شتࢪيد '..XBoT..'',
    'اطݪق وآحَد يصـيح '..NameBot..' '..XBoT..'',
    'شسالفهہ ڪافي 🥲',
    'خبصتَ آمڼهہ شتࢪيَد عاآد '..XBoT..''
} 
name = math.random(#namebot) 
send(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
send(msg.chat_id_, msg.id_, 1,'⌯︙لم تربح اي نقطه\n⌯︙ارسل ↫ الالعاب للعب', 1, 'md')
else 
send(msg.chat_id_, msg.id_, 1,'⌯︙عدد النقاط التي ربحتها ↫ '..(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then bot_data:del(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) send(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف جميع نقاطك', 1, 'md') end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then bot_data:del(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) send(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف جميع رسائلك', 1, 'md') end
--     source -𝐗-     --
if text == 'جهاته' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function ContactNumber_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Add_Mem = bot_data:get(XBOT.."MARTEN:ContactNumber"..msg.chat_id_..":"..data.id_) or 0
if Add_Mem == 0 then 
Text = "⌯︙ هو لم يقم باضافه اي جهات الئ المجموعة هذا"
else
Text = "⌯︙ عدد الجهات التي قام باضافتها هي *~ ( "..Add_Mem.." ) ~ جهات *"
end
send(msg.chat_id_, msg.id_, 1,Text, 1, 'md') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, ContactNumber_by_reply, nil)
return false
end
if text == 'رسائله' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function NumMsg_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local NumMsg = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
if NumMsg == 0 then 
Text = "⌯︙ هذا الشخص لم يقم بارسال ولا حتئ رسأله واحده"
else
Text = "⌯︙ عدد الرسائل التي قام بارسألها هنا *~ ❨ "..NumMsg.." ❩ ~ رساله *"
end
send(msg.chat_id_, msg.id_, 1,Text, 1, 'md')
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, NumMsg_by_reply, nil)
return false
end
if text == 'سحكاته' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function EditMsg_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local EditMsg = bot_data:get(XBOT..'MARTEN:EditMsg'..msg.chat_id_..data.id_) or 0
if EditMsg == 0 then 
Text = "⌯︙ العب غيرها حبيبي هذا سيبويه باللغة العربيه"
else
Text = "⌯︙ عدد السحكات للمصرين الي سحكهم *~ ❨ "..EditMsg.." ❩ ~ سحكه *"
end
send(msg.chat_id_, msg.id_, 1,Text, 1, 'md') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, EditMsg_by_reply, nil)
return false
end
if text == 'نقاطه' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function GamesNumber_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Num = tonumber(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..data.id_) or 0)
if Num == 0 then 
Text = "⌯︙ هو لم يلعب اي لعبه للحصول على النقاط"
else
Text = "⌯︙ عدد النقاط التي ربحها هي *~ ( "..Num.." ) ~ نقطه *"
end
send(msg.chat_id_, msg.id_, 1,Text, 1, 'md') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, GamesNumber_by_reply, nil)
return false
end
--     source -𝐗-     --
if text =='سمايلات' and ChCheck(msg) or text =='السمايلات' and ChCheck(msg) or text =='↫ سمايلات ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','??','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
XxBOt ='⌯︙اول واحد يدز هذا السمايل يربح ↫ '..name
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum'..msg.chat_id_) and not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ سمايلات للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end
if text =='ترتيب' and ChCheck(msg) or text =='الترتيب' and ChCheck(msg) or text =='↫ ترتيب ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
XxBOt ='⌯︙اول واحد يرتبها يربح ↫ '..name
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum'..msg.chat_id_) and not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ ترتيب للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end
if text =='محيبس' and ChCheck(msg) or text =='بات' and ChCheck(msg) or text =='المحيبس' and ChCheck(msg) or text =='↫ محيبس ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
bot_data:set(XBOT.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 •• 👊🏻 •• 👊🏼 •• 👊🏽 •• 👊🏾 •• 👊🏿
⌯︙اختر رقم لاستخراج المحيبس
⌯︙الفائز يحصل على (5) نقاط
]]
send(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
bot_data:setex(XBOT.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text =='حزوره' and ChCheck(msg) or text =='الحزوره' and ChCheck(msg) or text =='↫ حزوره ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
XxBOt ='⌯︙اول واحد يحلها يربح ↫ '..name
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum'..msg.chat_id_) and not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ حزوره للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end 
if text =='المعاني' and ChCheck(msg) or text =='معاني' and ChCheck(msg) or text =='↫ معاني ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum2'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
XxBOt ='⌯︙ما معنى هذا السمايل :؟ ↫ '..name
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum2'..msg.chat_id_) and not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ المعاني للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end 
if text =='العكس' and ChCheck(msg) or text =='عكس' and ChCheck(msg) or text =='↫ العكس ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum3'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
XxBOt ='⌯︙ما هو عكس كلمة ↫ '..name
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum3'..msg.chat_id_) and not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ العكس للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end 
if text =='المختلف' and ChCheck(msg) or text =='مختلف' and ChCheck(msg) or text =='↫ المختلف ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum4'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️??')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
XxBOt ='⌯︙اول واحد يطلع المختلف يربح\n{'..name..'} '
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum4'..msg.chat_id_) and not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ المختلف للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end  
if text =='امثله' and ChCheck(msg) or text =='الامثله' and ChCheck(msg) or text =='↫ امثله ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum5'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
XxBOt ='⌯︙اكمل المثال التالي ↫ ['..name..']'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum5'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
bot_data:del(XBOT..'MARTEN:GameNum5'..msg.chat_id_)
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ امثله للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end  
if text =='رياضيات' and ChCheck(msg) or text =='الرياضيات' and ChCheck(msg) or text =='↫ رياضيات ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum6'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
XxBOt ='⌯︙اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum6'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
bot_data:del(XBOT..'MARTEN:GameNum6'..msg.chat_id_)
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ رياضيات للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end  
if text =='الانكليزي' and ChCheck(msg) or text =='الانجليزيه' and ChCheck(msg) or text =='انكليزيه' and ChCheck(msg) or text =='↫ انكليزي ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum7'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
XxBOt ='⌯︙ما معنى كلمة ↫ '..name
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum7'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
bot_data:del(XBOT..'MARTEN:GameNum7'..msg.chat_id_)
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ انكليزيه للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end  
--     source -𝐗-     --
if text =='اسئله' and ChCheck(msg) or text =='اختيارات' and ChCheck(msg) or text =='الاسئله' and ChCheck(msg) or text =='اساله' and ChCheck(msg) or text =='↫ اسئله ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = bot_data2[math.random(#bot_data2)]
bot_data:set(XBOT..'MARTEN:GameNum8'..msg.chat_id_,name)
bot_data:del(XBOT..'MARTEN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','⌯︙ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','⌯︙ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','⌯︙كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','⌯︙كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','⌯︙كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','⌯︙من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','⌯︙من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','⌯︙ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','⌯︙ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','⌯︙ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','⌯︙ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','⌯︙ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','⌯︙ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','⌯︙اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','⌯︙في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','⌯︙على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','⌯︙ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','⌯︙اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','⌯︙تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','⌯︙كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','⌯︙ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','⌯︙ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','⌯︙ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','⌯︙ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','⌯︙ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','⌯︙ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','⌯︙ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','⌯︙ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','⌯︙من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
XxBOt = name..'\n⌯︙ارسل الجواب الصحيح فقط'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
return false
end end
if text == bot_data:get(XBOT..'MARTEN:GameNum8'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Games:Ids'..msg.chat_id_) then 
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
bot_data:del(XBOT..'MARTEN:GameNum8'..msg.chat_id_)
XxBOt ='⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ الاسئله للعب مره اخرى'
send(msg.chat_id_, msg.id_, 1,XxBOt, 1, 'md')
end
bot_data:set(XBOT..'MARTEN:Games:Ids'..msg.chat_id_,true)
end  
--     source -𝐗-     --
if bot_data:get(XBOT.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
send(msg.chat_id_, msg.id_, 1,"⌯︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = bot_data:get(XBOT.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
bot_data:del(XBOT..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
bot_data:del(XBOT.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
send(msg.chat_id_, msg.id_, 1,'⌯︙*التخمين الصحيح هو* ↫ '..NUM..'\n⌯︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
bot_data:incrby(XBOT..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(bot_data:get(XBOT..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
bot_data:del(XBOT..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
bot_data:del(XBOT.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_, 1,'⌯︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n⌯︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(bot_data:get(XBOT..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum ='محاولتان فقط'
elseif tonumber(bot_data:get(XBOT..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum ='محاوله واحده فقط'
end
send(msg.chat_id_, msg.id_, 1,'⌯︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text =='خمن' and ChCheck(msg) or text =='تخمين' and ChCheck(msg) or text =='↫ تخمين ⌯' and ChCheck(msg) then   
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
bot_data:set(XBOT.."GAMES:NUM"..msg.chat_id_,Num) 
send(msg.chat_id_, msg.id_, 1,'⌯︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n⌯︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
bot_data:setex(XBOT.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     source -𝐗-     --
if text =='روليت' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
bot_data:del(XBOT.."MARTEN:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
bot_data:del(XBOT..'MARTEN:ListRolet'..msg.chat_id_)  
bot_data:setex(XBOT.."MARTEN:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
send(msg.chat_id_, msg.id_, 1, '⌯︙حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and bot_data:get(XBOT.."MARTEN:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "⌯︙لا استطيع بدء اللعبه بلاعب واحد فقط"
else
bot_data:set(XBOT.."MARTEN:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text ='⌯︙تم بدء تسجيل اللسته يرجى ارسال المعرفات \n⌯︙الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
bot_data:del(XBOT.."MARTEN:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and bot_data:get(XBOT.."MARTEN:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if bot_data:sismember(XBOT..'MARTEN:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'⌯︙المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, 1,'⌯︙المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
bot_data:sadd(XBOT..'MARTEN:ListRolet'..msg.chat_id_,text)
local CountAdd = bot_data:get(XBOT.."MARTEN:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = bot_data:scard(XBOT..'MARTEN:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
bot_data:del(XBOT.."MARTEN:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
bot_data:setex(XBOT.."MARTEN:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "⌯︙تم ادخال المعرف ↫ ["..text.."]\n⌯︙وتم اكتمال العدد الكلي هل انت مستعد ؟"
local inline = {{{text="• نعم •",callback_data="/YesRolet"},{text="• لا •",callback_data="/NoRolet"}},{{text="• اللاعبين •",callback_data="/ListRolet"}}} 
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end 
local Text = "⌯︙تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
local inline = {{{text="• الغاء •",callback_data="/NoRolet"}}} 
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil) 
end
--     source -𝐗-     --
if text =='كت' and ChCheck(msg) or text =='تويت' and ChCheck(msg) or text =='↫ كت ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
local XxBOt = {
'آخر مرة زرت مدينة الملاهي؟','آخر مرة أكلت أكلتك المفضّلة؟','الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل','آخر شيء ضاع منك؟','كلمة أخيرة لشاغل البال؟','طريقتك المعتادة في التخلّص من الطاقة السلبية؟','شهر من أشهر العام له ذكرى جميلة معك؟','كلمة غريبة من لهجتك ومعناها؟🤓','‏- شيء سمعته عالق في ذهنك هاليومين؟','متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟','‏- أبرز صفة حسنة في صديقك المقرب؟','هل تشعر أن هنالك مَن يُحبك؟','اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟','أجمل شيء حصل معك خلال هاليوم؟','صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔','كلمة لشخص غالي اشتقت إليه؟💕','آخر خبر سعيد، متى وصلك؟','أنا آسف على ....؟','أوصف نفسك بكلمة؟','صريح، مشتاق؟','‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟','‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭','‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤','‏- تخيّل شيء قد يحدث في المستقبل؟','‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚','شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟','| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.','كم مره تسبح باليوم','نسبة النعاس عندك حاليًا؟','لو فقط مسموح شخص واحد تتابعه فالسناب مين بيكون ؟','يهمك ملابسك تكون ماركة ؟','وش الشيء الي تطلع حرتك فيه و زعلت ؟','عندك أخوان او خوات من الرضاعة؟','عندك معجبين ولا محد درا عنك؟','أصعب صفة قد تتواجد في الرجل .؟','كم المده الي تخليك توقع بحب الشخص؟.','تحس انك مستعد للقاء الله ولا باقي.؟','متصالح مع نفسك؟.','يسكر على أصبعك الباب ولا تعض لسانك  بالغلط؟!','عندك غمازات؟.','‏ألوانك المفضّلة؟','ردة فعلك لما تنظلم من شخص ؟','وش الحب بنظرك؟','أكثر شيء تقدره في الصداقات؟','‏لوخيروك ⁞ الاكل لو النت ؟!','عاجبك وجودك في التلي ولا تتمنى تحذفة.؟','افضل هديه ممكن تناسبك؟','شعورك الحالي في جملة؟','أنا حزين جداً أجعلني أبتسم.؟','بماذا يتعافى المرء؟','تاك لشخص نفسيه؟','شاركنا بيت شعري حزين على ذوقك.؟','اغنية عندك بيها ذكريات؟','اشياء تفتخر انك م سويتها ؟','الصراحة وقاحة ولا صدق تعامل.؟','ايهم اصدق نظرة العين او نبرة الصوت ؟','‏قلّة المال لدى الرجل في هذا الزمن يعتبرها العديد كانها عيب، مع أم ضد؟','إيهما تُفضل حُب ناجح أم صداقة دائمة.؟','على نياتكُم تُرزقون تاك لشخص ينطبق علية هذا الشيء.؟','اكثر كلمة ترفع ضغطك ؟','من أصحاب الماضي والحنين ولا الصفحات المطوية.؟','من أصحاب النسيان او التجاوز رغم الذكرى.؟','غزل بلهجتك ؟','مصروفك كم؟.','للحتيت ⁞ ماذا تفضّلين أن تكون مهنة شريك حياتك المستقبلي.؟','يومك ضاع على؟','ما الذي اسعدك اليوم .؟','كيف تتعامل مع الشخص المُتطفل ( الفضولي ) ؟','أصعب صفة قد تتواجد في المرأة.؟','مع أو ضد لو كان خيراً لبقئ.؟','نصيحة لكل شخص يذكر أحد بغيابة بالسوء.؟','كل شيء يهون الا ؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','كلمه لشخص خانك!؟.','تحب تحتفظ بالذكريات ؟','شاركنا أقوى بيت شِعر من تأليفك؟','‏اسرع شيء يحسّن من مزاجك؟','كلمتك التسليكيه ؟','كم ساعات نومك؟.','عندك فوبيا او خوف شديد من شيء معين ؟','موهبة تفوز بمدح الناس لك.؟','قدوتك من الأجيال السابقة؟','شخص تتمنئ له الموت؟.','عادةً تُحب النقاش الطويل أم تحب الاختصار؟','تاك لشخص نيته زباله🌚؟','صوتك حلو ؟ .','كلمتين تكررها دايم؟!','افضل روايه قريتيها؟.','متى حدث التغيير الكبير والملحوظ في شخصيتك؟','أكثر اكلهه تحبها؟.','‏كلما ازدادت ثقافة المرء ازداد بؤسه','تتفق.؟','اغبى كذبه صدقتها بطفولتك؟.','كم المده الي تخليك توقع بحب الشخص؟.','تسامح شخص وجع قلبك ؟.','ردة فعلك لما تنظلم من شخص ؟','شيء يعدل نفسيتك بثواني.؟','‏تتوقع الإنسان يحس بقرب موته؟','وقت حزنك تلجأ لمن يخفف عنك.؟','‏أكثر شيء شخصي ضاع منك؟','تزعلك الدنيا ويرضيك ؟','ما الذي يشغل بالك في الفترة الحالية؟','نهارك يصير أجمل بوجود ..؟','حسيت انك ظلمت شخص.؟','صفة يطلقها عليك من حولك بكثرة؟','‏يوم لا يمكنك نسيانه؟','أكثر اكلهه تحبها؟.','اخر كلمة قالها لك حبيبك؟.','من الشخص الاقرب لقلبك؟.','كم المده الي تخليك توقع بحب الشخص؟.','ماهي الهدية التي تتمنى أن تنتظرك يومًا أمام باب منزلك؟','‏اسم او تاك لشخص لا ترتاح في يومك إلا إذا حاجيته؟','صديق أمك ولا أبوك. ؟','لماذا الأشياء التي نريدها بشغف تأتي متأخرة؟','‏تقبل بالعودة لشخص كسر قلبك مرتين؟','افضل هديه ممكن تناسبك؟','كلمة غريبة ومعناها؟','اذا اشتقت تكابر ولا تبادر ؟.','بامكانك تنزع شعور من قلبك للابد ، ايش هو؟.','لو بتغير اسمك ايش بيكون الجديد ؟','‏شخصية لا تستطيع تقبلها؟','ما هي طريقتك في الحصول على الراحة النفسية؟','‏ايموجي يوصف مزاجك حاليًا بدقة؟','تاريخ ميلادك؟','كيف تحد الدولة من الفقر المُتزايد.؟','‏شي مستحيل يتغير فيك؟','لو اخذوك لمستشفى المخابيل كيف تثبت انت صاحي؟','إيموجي يعبّر عن مزاجك الحالي؟','وقت حزنك تلجأ لمن يخفف عنك.؟','اعترف باي حاجه ؟','شاركني آخر صورة جميلة من كاميرا هاتفك.؟','متصالح مع نفسك؟.','لو عندك امنيه وبتحقق وش هي؟.','هل انت شخص مادي.؟','أخر اتصال جاك من مين ؟','تاك لصديقك المُقرب؟.','تحب العلاقات العاطفيه ولا الصداقه؟.','العين الي تستصغرك........؟','تجامل الناس ولا اللي بقلبك على لسانك؟','وقت حزنك تلجأ لمن يخفف عنك.؟','اكثر المتابعين عندك باي برنامج؟','صفه تتمناها بشريك حياتك؟.','من اصدق في الحب الولد ولا البنت؟.','يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟','كلمة لشخص بعيد؟','رحتي لعرس وأكتشفتي العريس حبيبك شنو ردة فعلك.؟','تسامح شخص وجع قلبك ؟.','احقر موقف صار لك؟.','ماذا لو كانت مشاعر البشر مرئية ؟','وين نلقى السعاده برايك؟','قد تخيلت شي في بالك وصار ؟','صفة يطلقها عليك الشخص المفضّل؟','اخر خيانه؟.','تحب تحتفظ بالذكريات ؟','لو بتغير اسمك ايش بيكون الجديد ؟','الاعتذار أخلاق ولا ضعف.؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','‏ تكره أحد من قلبك ؟','تاك لشخص وكوله اعترف لك؟','مع أو ضد لو كان خيراً لبقئ.؟','‏هل لديك شخص لا تخفي عنه شيئًا؟','اغنيه تأثر بيك؟','المطوعة والعاقلة من شلتك.؟','مواصفات امير/ة احلامك؟.','‏كلمة لصديقك البعيد؟','تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته؟','قرارتك راضي عنها ام لا ؟','تسامح شخص سبب في بكائك.؟','لو حصل واشتريت جزيرة، ماذا ستختار اسمًا لها.؟','اغنيتك المفضلة؟.','شاركنا اقوئ نكتة عندك.؟','ماذا لو عاد مُشتاقاً.؟','مسلسل كرتوني له ذكريات جميلة عندك؟','أخر اتصال جاك من مين ؟','حيوانك المفضل؟','اول ولد لك شنو رح تسميه ؟','سبب الرحيل.؟','قولها بلهجتك « لا أملك المال ».؟','نهارك يصير أجمل بوجود ..؟','‏لو خيروك، الزواج بمن تُحب او تاخذ مليون دولار؟','تاك لشخص سوالفه حلوه ؟','تصرف لا يُمكن أن تتحمله.؟','ماهي الاطباع فيك التي تحاول اخفائها عن الناس؟.','شيء عندك اهم من الناس؟','قد تخيلت شي في بالك وصار ؟','تمحي العشرة الطيبة عشان موقف ماعجبك أو سوء فهم.؟','جربت شعور احد يحبك بس انت متكدر تحبه؟','بنفسك تبوس شخص بهاي الحظه؟','إذا كانت الصراحة ستبعد عنك من تحب هل تمتلك الشجاعة للمصارحة ام لا .؟','أكمل الدعاء بما شئت ‏اللهم أرزقني ..؟','الصق اخر شيء نسخته .؟','‏تفضل جولة في الغابة أم جولة بحرية؟','‏تاك لشخص لديك لا تخفي عنه شي؟','كلمة غريبة ومعناها؟','‏اوقات لا تحب ان يكلمك فيها احد؟','تملك وسواس من شيء معين ؟','اشمر مقطع من اغنيه متطلع منراسك؟','هل تتأثرين بالكلام الرومانسي من الشباب؟','ما اول شيء يلفت انتباهك في الرجل؟','ماذا تفعلين اذا تعرضتِ للتحرش من قبل شخص ما..؟','اذا كنت شخصاً غني هل توافق على الزواج من فتاة فقيرة..؟','ما هو أكثر شئ لا تستطيع تحمله..؟','ما هي نقاط الضعف في شخصيتك..؟','هل توافق أن زوجتك تدفع الحساب في إحدي المطاعم وأنت موجود؟','ماذا تفعل لو أكتشفت ان زوجتك على علاقة بصديقك؟','ما هي أكثر صفة تكرهها في زوجتك..؟','اذا كان لديك فرصة للخروج مع من سوف تخرج ربعك او زوجتك..؟','ماذا تفعل عندما تري دموع زوجتك..؟','إلى أي الرجال تُريدين أن يكون انتماؤك؟','كم مرة خُدعت في أشخاصٍ، وثقتِ فيهم ثقةً عمياء؟','هل ما زال أصدقاء الطفولة أصدقاءً لك حتى الآن؟','هل ترغبين في أن يكون خطيبك وسيمًا؟','كم مرةٍ فعلت شيئًا لا ترغبين في الإفصاح عنه؟','هل استطعت أن تُحققي آمالك العلمية والعاطفية؟','أكثر شئ ندمت على فعله..؟','هل تشعرين أنك فتاة محظوظة..؟','هل علاقة الحب التي كانت في صغرك، مازالت مستمرة؟','ما هو أكثر شئ يفرحك في هذه الحياة..؟','كم مرة أردت شراء ملابس لأنها جميلة ولكنها لا تناسبك..؟','كم عدد المرات التي قمت فيها بإستبدال شئ اشتريته ولم يعجبك بعد ذلك.؟','كم مرة قمت بكسر الرجيم من أجل تناول طعامك المفضل..؟','هل تعرضت للظلم يوماً ما وعلى يد من..؟','هل كذبت على والديك من قبل..؟','هل خرجتي مع شخص تعرفتي عليه من خلال التليكرام من قبل..؟','هل لو تقدم شخص لاختك من أجل خطبتها وقامت برفضه تقبلين به..؟','لمن تقولين لا أستطيع العيش بدونك..؟','كم عدد المرات التي تعرضتِ فيها إلى أزمة نفسية وأردتِ الصراخ بأعلى صوتك..؟','ماذا تقول للبحر؟','أصعب صفة قد تتواجد في رجل؟','ما أجمل الحياة بدون ...؟','لماذا لم تتم خطبتك حتى الآن..؟','نسبة رضاك عن الأشخاص من حولك هالفترة ؟','ما السيء في هذه الحياة ؟','الفلوس او الحب ؟','أجمل شيء حصل معك خلال هذا الاسبوع ؟','سؤال ينرفزك ؟','كم في حسابك البنكي ؟','شي عندك اهم من الناس ؟','اول ولد او بنت الك شنو تسمي ؟','تفضّل النقاش الطويل او تحب الاختصار ؟','عادي تتزوج او تتزوجين من خارج العشيره ؟','كم مره حبيت ؟','تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب ؟','قلبي على قلبك مهما صار لمنو تكولها ؟','اكثر المتابعين عندك باي برنامج ؟','نسبة النعاس عندك حاليًا ؟','نسبه الندم عندك للي وثقت بيهم ؟','اول شخص تعرفت عليه بالتليكرام بعده موجود ؟','اذا فديوم شخص ضلمك شنو موقفك ؟','افضل عمر للزواج برئيك ؟','انت من النوع الي دائما ينغدر من اقرب الناس اله ؟','ماهو حيوانك المفضل ؟','تاريخ ميلادك ؟','لونك المفضل ؟','انت من النوع العاطفي والي ميكدر يكتم البداخله ؟','اذا فديوم شخص خانك ويريد يرجعلك تقبل ؟','شي بالحياه مخليك عايش لحد الان ؟','تحب النوم لو الشغل ؟','افضل مكان رحت عليه ؟','اختصر الماضي بكلمه وحده ؟','هل سبق وكنت مصر على أمر ما ومن ثم اكتشفت أنك كنت على خطأ ؟','اكثر كلمة ترفع ضغطك ؟','مع او ضد سب البنت للدفاع عن نفسها ؟','يهمك ظن الناس بيك لو لا؟','عبّر عن مودك بصوره ؟','اغلب وقتك ضايع في ؟','يوم متكدر تنساه ؟','تحس انك محظوظ بالاشخاص الي حولك ؟','تستغل وقت فراغك بشنو ؟','مع او ضد مقولة محد يدوم ل احد ؟','لو اخذوك مستشفى المجانين كيف تثبت لهم انك صاحي ؟','مغني تلاحظ أن صوته يعجب الجميع إلا أنت ؟','اخر خيانه ؟','تصرف ماتتحمله ؟','هل يمكنك الكذب والاستمرار بارتكاب الأخطاء كمحاولة منك لعدم الكشف أنك مخطئ ؟','الصق اخر شي نسخته ؟','عمرك انتقمت من أحد ؟','هل وصلك رسالة غير متوقعة من شخص وأثرت فيك ؟','‏-لو امتلكت العصا السحرية ليوم واحد ماذا ستفعل ؟','جابو طاري شخص تكره عندك تشاركهم ولا تمنعهم ؟','أمنية كنت تتمناها وحققتها ؟','هل التعود على شخص والتحدث معه بشكل يومي يعتبر نوع من أنواع الحب ؟','نسبة جمال صوتك ؟','صفة يطلقها عليك الشخص المفضل ؟','شنو هدفك بالمستقبل القريب ؟','تحب القرائه ؟','كليه تتمنى تنقبل بيها ؟',
'أطول مدة قضيتها بعيد عن أهلك ؟','لو يجي عيد ميلادك تتوقع يجيك هدية؟','يبان عليك الحزن من " صوتك - ملامحك','وين تشوف نفسك بعد سنتين؟','وش يقولون لك لما تغني ؟','عندك حس فكاهي ولا نفسية؟','كيف تتصرف مع الشخص الفضولي ؟','كيف هي أحوال قلبك؟','حاجة تشوف نفسك مبدع فيها ؟','متى حبيت؟','شيء كل م تذكرته تبتسم ...','العلاقه السريه دايماً تكون حلوه؟','صوت مغني م تحبه','لو يجي عيد ميلادك تتوقع يجيك هدية؟','اذا احد سألك عن شيء م تعرفه تقول م اعرف ولا تتفلسف ؟','مع او ضد : النوم افضل حل لـ مشاكل الحياة؟','مساحة فارغة (..............) اكتب اي شيء تبين','اغرب اسم مر عليك ؟','عمرك كلمت فويس احد غير جنسك؟','اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟','لو عندك فلوس وش السيارة اللي بتشتريها؟','وش اغبى شيء سويته ؟','شيء من صغرك ماتغير فيك؟','وش نوع الأفلام اللي تحب تتابعه؟','وش نوع الأفلام اللي تحب تتابعه؟','تجامل احد على حساب مصلحتك ؟','تتقبل النصيحة من اي شخص؟','كلمه ماسكه معك الفترة هذي ؟','متى لازم تقول لا ؟','اكثر شيء تحس انه مات ف مجتمعنا؟','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','هل تعتقد أن هنالك من يراقبك بشغف؟','اشياء اذا سويتها لشخص تدل على انك تحبه كثير ؟','اشياء صعب تتقبلها بسرعه ؟','اقتباس لطيف؟','أكثر جملة أثرت بك في حياتك؟','عندك فوبيا من شيء ؟.',
'اكثر لونين تحبهم مع بعض؟','أجمل بيت شعر سمعته ...','سبق وراودك شعور أنك لم تعد تعرف نفسك؟','تتوقع فيه احد حاقد عليك ويكرهك ؟','أجمل سنة ميلادية مرت عليك ؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','وش تحس انك تحتاج الفترة هاذي ؟','يومك ضاع على؟','@منشن .. شخص تخاف منه اذا عصب ...','فيلم عالق في ذهنك لا تنساه مِن روعته؟','تختار أن تكون غبي أو قبيح؟','الفلوس او الحب ؟','أجمل بلد في قارة آسيا بنظرك؟','ما الذي يشغل بالك في الفترة الحالية؟','احقر الناس هو من ...','وين نلقى السعاده برايك؟','اشياء تفتخر انك م سويتها ؟','تزعلك الدنيا ويرضيك ؟','وش الحب بنظرك؟','افضل هديه ممكن تناسبك؟','كم في حسابك البنكي ؟','كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟','عمرك انتقمت من أحد ؟!','ما السيء في هذه الحياة ؟','غنية عندك معاها ذكريات🎵🎻','/','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أطول مدة نمت فيها كم ساعة؟','أصعب قرار ممكن تتخذه ؟','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أنت محبوب بين الناس؟ ولاكريه؟','إحساسك في هاللحظة؟','اخر شيء اكلته ؟','تشوف الغيره انانيه او حب؟','اذكر موقف ماتنساه بعمرك؟','اكثر مشاكلك بسبب ؟','اول ماتصحى من النوم مين تكلمه؟','آخر مرة ضحكت من كل قلبك؟','لو الجنسية حسب ملامحك وش بتكون جنسيتك؟','اكثر شيء يرفع ضغطك','اذكر موقف ماتنساه بعمرك؟','لو قالوا لك  تناول صنف واحد فقط من الطعام لمدة شهر .',
'كيف تشوف الجيل ذا؟','ردة فعلك لو مزح معك شخص م تعرفه ؟','احقر الناس هو من ...','تحب ابوك ولا امك','آخر فيلم مسلسل والتقييم🎥؟','أقبح القبحين في العلاقة: الغدر أو الإهمال🤷🏼؟','كلمة لأقرب شخص لقلبك🤍؟','حط@منشن لشخص وقوله "حركتك مالها داعي"😼!','اذا جاك خبر مفرح اول واحد تعلمه فيه مين💃🏽؟','طبع يمكن يخليك تكره شخص حتى لو كنت تُحبه🙅🏻‍♀️؟','افضل ايام الاسبوع عندك🔖؟','يقولون ان الحياة دروس ، ماهو أقوى درس تعلمته من الحياة🏙؟','تاريخ لن تنساه📅؟','تحب الصيف والا الشتاء❄️☀️؟','شخص تحب تستفزه😈؟','شنو ينادونك وانت صغير (عيارتك)👼🏻؟','عقل يفهمك/ج ولا قلب يحبك/ج❤️؟','اول سفره لك وين رح تكون✈️؟','كم عدد اللي معطيهم بلوك👹؟','نوعية من الأشخاص تتجنبهم في حياتك❌؟','شاركنا صورة او فيديو من تصويرك؟📸','كم من عشره تعطي حظك📩؟','اكثر برنامج تواصل اجتماعي تحبه😎؟','من اي دوله انت🌍؟','اكثر دوله ودك تسافر لها🏞؟','مقولة "نكبر وننسى" هل تؤمن بصحتها🧓🏼؟','تعتقد فيه أحد يراقبك👩🏼‍💻؟','لو بيدك تغير الزمن ، تقدمه ولا ترجعه🕰؟','مشروبك المفضل🍹؟','‏قم بلصق آخر اقتباس نسخته؟💭','كم وزنك/ج طولك/ج؟🌚','كم كان عمرك/ج قبل ٨ سنين😈؟','دوله ندمت انك سافرت لها😁؟','لو قالو لك ٣ أمنيات راح تتحقق عالسريع شنو تكون🧞‍♀️؟','‏- نسبة احتياجك للعزلة من 10📊؟','شخص تحبه حظرك بدون سبب واضح، ردة فعلك🧐؟','مبدأ في الحياة تعتمد عليه دائما🕯؟',
}  
Text =''..XxBOt[math.random(#XxBOt)]..''
send(msg.chat_id_, msg.id_, 1, Text, 1, 'md')  
return false
end
end
--     source -𝐗-     --
if text == "مسح سحكاتي" or text == "مسح رسائلي" then
local Msg = bot_data:get(XBOT..'MARTEN:Msg')
local Text = '⌯︙من خلال الازرار يمكنك مسح رسائلك وسحكاتك'
local inline = {{{text="• مسح رسائلي •",callback_data="/DelMsg:"..msg.sender_user_id_},{text="• مسح سحكاتي •",callback_data="/DelEdit:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text and (text == "التسليه" or text == "اوامر التسليه" or text == "تسليه" or text == "تسلية" or text == "التسلية") and ChCheck(msg) then
local Tsl = bot_data:get(XBOT..'MARTEN:Tsl')
local Text = [[
*⌯︙اهلا بك في قائمة اوامر التسليه ↫ ⤈*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
*⌯︙غنيلي*
*⌯︙اغنيه*
*⌯︙متحركه*
*⌯︙ريمكس*
*⌯︙ميمز*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
local inline = {{{text="• غنيلي •",callback_data="/Song:"..msg.sender_user_id_},{text="• اغنيه •",callback_data="/mp3:"..msg.sender_user_id_}},{{text="• متحركه •",callback_data="/gif:"..msg.sender_user_id_},{text="• صوره •",callback_data="/photo:"..msg.sender_user_id_}},{{text="• انمي •",callback_data="/anime:"..msg.sender_user_id_},{text="• ريمكس •",callback_data="/remix:"..msg.sender_user_id_}},{{text="• ميمز •",callback_data="/memz:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text ==('تحكم') and ChCheck(msg) and Admin(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
send(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text ='⌯︙قم باستعمال الازرار للتحكم العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')'
local inline = {{{text="• رفع رتبه •",callback_data=msg.sender_user_id_..":SetList:"..result.sender_user_id_},{text="• تنزيل رتبه •",callback_data=msg.sender_user_id_..":RemList:"..result.sender_user_id_}},{{text="• كتم •",callback_data=msg.sender_user_id_..":Mute:"..result.sender_user_id_},{text="• الغاء كتم •",callback_data=msg.sender_user_id_..":UnMute:"..result.sender_user_id_}},{{text="• حظر •",callback_data=msg.sender_user_id_..":Ban:"..result.sender_user_id_},{text="• الغاء حظر •",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},{{text="• تقيد •",callback_data=msg.sender_user_id_..":Tkeed:"..result.sender_user_id_},{text="• الغاء تقيد •",callback_data=msg.sender_user_id_..":UnTkeed:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     source -𝐗-     --
if text ==('رفع') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
send(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text ='⌯︙قم باستعمال الازرار لرفع العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')'
keyboard = {} 
if Sudo(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="• رفع منشئ •",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="• رفع مدير •",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="• رفع منظف •",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="• رفع منشئ اساسي •",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="• رفع مالك •",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_},{text="• رفع مطور •",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text="• رفع مطور ثانوي •",callback_data=msg.sender_user_id_..":SetSecondSudo:"..result.sender_user_id_},{text="• رفع مطور اساسي •",callback_data=msg.sender_user_id_..":SetMARTENSudo:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif MARTENSudo(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="• رفع منشئ •",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="• رفع مدير •",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="• رفع منظف •",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="• رفع منشئ اساسي •",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="• رفع مالك •",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_},{text="• رفع مطور •",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text="• رفع مطور ثانوي •",callback_data=msg.sender_user_id_..":SetSecondSudo:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SecondSudo(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="• رفع منشئ •",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="• رفع مدير •",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="• رفع منظف •",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="• رفع منشئ اساسي •",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="• رفع مالك •",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_},{text="• رفع مطور •",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SudoBot(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="• رفع منشئ •",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="• رفع مدير •",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="• رفع منظف •",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="• رفع منشئ اساسي •",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="• رفع مالك •",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Owner(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="• رفع منشئ •",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="• رفع مدير •",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="• رفع منظف •",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="• رفع منشئ اساسي •",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif BasicConstructor(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="• رفع منشئ •",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="• رفع مدير •",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="• رفع منظف •",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Constructor(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="• رفع منظف •",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="• رفع مدير •",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Manager(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="• رفع ادمن •",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Admin(msg) then
keyboard.inline_keyboard = {{{text="• رفع مميز •",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
end
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     source -𝐗-     --
if text ==('تنزيل') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
send(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text ='⌯︙قم باستعمال الازرار لتنزيل العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'SrcX_B0T')..')'
keyboard = {} 
if Sudo(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="• تنزيل منشئ •",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="• تنزيل مدير •",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="• تنزيل منظف •",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="• تنزيل منشئ  اساسي •",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="• تنزيل مالك •",callback_data=msg.sender_user_id_..":RemOwner:"..result.sender_user_id_},{text="• تنزيل مطور •",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text="• تنزيل مطور ثانوي •",callback_data=msg.sender_user_id_..":RemSecondSudo:"..result.sender_user_id_},{text="• تنزيل مطور اساسي •",callback_data=msg.sender_user_id_..":RemMARTENSudo:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif MARTENSudo(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="• تنزيل منشئ •",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="• تنزيل مدير •",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="• تنزيل منظف •",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="• تنزيل منشئ  اساسي •",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="• تنزيل مالك •",callback_data=msg.sender_user_id_..":RemOwner:"..result.sender_user_id_},{text="• تنزيل مطور •",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text="• تنزيل مطور ثانوي •",callback_data=msg.sender_user_id_..":RemSecondSudo:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SecondSudo(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="• تنزيل منشئ •",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="• تنزيل مدير •",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="• تنزيل منظف •",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="• تنزيل منشئ  اساسي •",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="• تنزيل مالك •",callback_data=msg.sender_user_id_..":RemOwner:"..result.sender_user_id_},{text="• تنزيل مطور •",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif SudoBot(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="• تنزيل منشئ •",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="• تنزيل مدير •",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="• تنزيل منظف •",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="• تنزيل منشئ  اساسي •",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="• تنزيل مالك •",callback_data=msg.sender_user_id_..":RemOwner:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Owner(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="• تنزيل منشئ •",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="• تنزيل مدير •",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="• تنزيل منظف •",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="• تنزيل منشئ  اساسي •",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif BasicConstructor(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="• تنزيل منشئ •",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="• تنزيل مدير •",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="• تنزيل منظف •",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Constructor(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="• تنزيل منظف •",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="• تنزيل مدير •",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Manager(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="• تنزيل ادمن •",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
elseif Admin(msg) then
keyboard.inline_keyboard = {{{text="• تنزيل مميز •",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
end
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     source -𝐗-     --
if text == "الرابط" then
local Link = bot_data:get(XBOT..'MARTEN:Link')
local Text = '*⌯︙اختر نوع الرابط لجلبه*'
local inline = {{{text="• الرابط نص •",callback_data="/LinkText:"..msg.sender_user_id_},{text="• الرابط انلاين •",callback_data="/Linkinline:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text =='الالعاب' and ChCheck(msg) or text =='العاب' and ChCheck(msg) or text =='اللعبه' and ChCheck(msg) or text =='↫ الالعاب ⌯' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) then
local Games = bot_data:get(XBOT..'MARTEN:Games')
local Text = [[
⌯︙قائمة العاب المجموعه ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙لعبة التخمين ↫ خمن
⌯︙لعبة الامثله ↫ امثله
⌯︙لعبة العكس ↫ العكس
⌯︙لعبة الاسئله ↫ اسئله
⌯︙لعبة الروليت ↫ روليت
⌯︙لعبة الحزوره ↫ حزوره
⌯︙لعبة الترتيب ↫ ترتيب
⌯︙لعبة المعاني ↫ معاني
⌯︙لعبة التويت ↫ كت تويت
⌯︙لعبة المختلف ↫ المختلف
⌯︙لعبة السمايلات ↫ سمايلات
⌯︙لعبة المحيبس ↫ المحيبس
⌯︙لعبة الرياضيات ↫ رياضيات
⌯︙لعبة الانكليزيه ↫ انكليزيه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙نقاطي • بيع نقاطي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
local inline = {{{text="• الالعاب المتطوره •",callback_data="/GameInline:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
end
--     source -𝐗-     --
if text =='بيع نقاطي' and ChCheck(msg) then
if tonumber((bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
send(msg.chat_id_, msg.id_, 1,'⌯︙لم تربح اي نقطه\n⌯︙ارسل ↫ الالعاب للعب', 1, 'md')
else
bot_data0 = (bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
bot_data:incrby(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,bot_data0)
send(msg.chat_id_, msg.id_, 1,'⌯︙تم بيع '..(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n⌯︙كل نقطه تساوي 50 رساله', 'md')
bot_data:del(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     source -𝐗-     --
if text =='رفع المشرفين' and ChCheck(msg) or text =='رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,SoFi) 
local num = 0
local admins = SoFi.members_  
for i=0 , #admins do   
if SoFi.members_[i].bot_info_ == false and SoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if SoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,Manager_id)  
bot_data:sadd(XBOT..'MARTEN:MARTENConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لا يوجد ادمنيه ليتم رفعهم\n⌯︙تم رفع مالك المجموعه", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⌯︙تم رفع '..num..' من الادمنيه \n⌯︙تم رفع مالك المجموعه', 1, 'md')
end
end,nil) 
end
--     source -𝐗-     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa ='المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa ='الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa ='عضو'
end
send(msg.chat_id_, msg.id_, 1, '⌯︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     source -𝐗-     --
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(bot_data:get(XBOT..'MARTEN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username ='@'..result.username_ else username ='لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname ='' end
send(msg.chat_id_, msg.id_, 1, '⌯︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n⌯︙معرفك ↫ ❨ ['..username..'] ❩\n⌯︙ايديك ↫ ❨ `'..result.id_..'` ❩\n⌯︙نقاطك ↫ ❨ '..user_nkt..' ❩\n⌯︙رسائلك ↫ ❨ '..user_msgs..' ❩\n⌯︙جهاتك ↫ ❨ '..cont..' ❩\n⌯︙تفاعلك ↫ '..formsgs(msguser)..'\n⌯︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     source -𝐗-     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" or text == "↫ تعيين قناة الاشتراك ⌯" then
if not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
bot_data:setex(XBOT..'bot_data4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '⌯︙ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" or text == "↫  تفعيل الاشتراك الاجباري ⌯" then  
if not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
if bot_data:get(XBOT..'MARTEN:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..bot_data:get(XBOT.."MARTEN:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"⌯︙الاشتراك الاجباري مفعل \n⌯︙على القناة ↫ [@"..GetInfo.result.username.."]")
else
bot_data:setex(XBOT..'bot_data4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"⌯︙لاتوجد قناة لتفعيل الاشتراك\n⌯︙ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" or text == "↫  تعطيل الاشتراك الاجباري ⌯" then  
if not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
bot_data:del(XBOT..'MARTEN:ChId')
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الاشتراك الاجباري\n•-› X")
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" or text == "↫ حذف قناة الاشتراك ⌯" then
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
bot_data:del(XBOT..'MARTEN:ChId')
send(msg.chat_id_, msg.id_, 1,"⌯︙تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text =='جلب قناة الاشتراك' or text =='قناة الاشتراك' or text =='الاشتراك الاجباري' or text =='قناة الاشتراك الاجباري' or text =='↫ قناة الاشتراك ⌯' then
if bot_data:get(XBOT..'MARTEN:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..bot_data:get(XBOT.."MARTEN:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "⌯︙قناة الاشتراك ↫ [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "⌯︙لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     source -𝐗-     --
if SudoBot(msg) then
if text =='اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function XxBOt(extra,result,success)
if bot_data:get(XBOT.."MARTEN:Send:Bot"..XBOT) and not MARTENSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = bot_data:smembers(XBOT.."MARTEN:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = bot_data:smembers(XBOT.."MARTEN:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
send(msg.chat_id_, msg.id_, 1, '⌯︙تم اذاعة رسالتك بالتوجيه \n⌯︙‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n⌯︙والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),XxBOt)
end
end
--     source -𝐗-     --
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
bot_data:set(XBOT..'MARTEN:viewget'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '⌯︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     source -𝐗-     --
if text == "السورس" or text == "سورس" or text == "يا سورس" or text == "↫  السورس ⌯" then  
local Text =[[
⦑ Welcome to Source ⦒
 ⦑ SOURCE DRAGON ⦒ 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
⌯︙ [Source Channel](t.me/SrcX_B0T)
⌯︙ [Source Update ](t.me/FIDRG) 
⌯︙ [Source developer](t.me/s00f4) 
⌯︙ [Source programmer](t.me/mndzr) 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
𓂅 . [TWS DRAGON](t.me/SrcX_B0Tbot) 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'سـوࢪس أڪـس  メ', url="t.me/SrcX_B0T"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/SrcX_B0T&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if ChatType =='sp' or ChatType =='gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if bot_data:get(XBOT.."MARTEN:Kick:Me"..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
bot_data:set(XBOT..'yes'..msg.sender_user_id_, 'delyes')
bot_data:set(XBOT..'no'..msg.sender_user_id_, 'delno')
local Text ='⌯︙هل انت متأكد من المغادره'
local inline = {{{text="• نعم •",callback_data="/delyes"},{text="• لا •",callback_data="/delno"}}} 
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text =='تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
bot_data:set(XBOT.."MARTEN:Kick:Me"..msg.chat_id_, true)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر اطردني\n•-› X")
end
if text =='تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
bot_data:del(XBOT.."MARTEN:Kick:Me"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر اطردني\n•-› ✓")
end
--     source -𝐗-     --
if text == "نزلني" and ChCheck(msg) then
if bot_data:get(XBOT.."MARTEN:Del:Me"..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
bot_data:set(XBOT..'yesdel'..msg.sender_user_id_, 'delyes')
bot_data:set(XBOT..'nodel'..msg.sender_user_id_, 'delno')
local Text ='⌯︙هل انت متأكد من تنزيلك'
local inline = {{{text="• نعم •",callback_data="/yesdel"},{text="• لا •",callback_data="/nodel"}}} 
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text =='تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
bot_data:set(XBOT.."MARTEN:Del:Me"..msg.chat_id_, true)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر نزلني\n•-› X")
end
if text =='تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
bot_data:del(XBOT.."MARTEN:Del:Me"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر نزلني\n•-› ✓")
end
--     source -𝐗-     --
if text and (text =='تفعيل التاك' or text =='تفعيل التاك للكل' or text =='تفعيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر تاك للكل\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:TagAll'..msg.chat_id_)
end
if text and (text =='تعطيل التاك' or text =='تعطيل التاك للكل' or text =='تعطيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر تاك للكل\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:TagAll'..msg.chat_id_,true)
end
--     source -𝐗-     --
if text == "كشف الرتب" or text == "الرتب" then
local Text = '*⌯︙اليك الرتب الاتيـة وعددها ↫ ⤈ ⚖️*'
local ListSudo = bot_data:scard(XBOT.."MARTEN:MARTENSudo:")
local ListSecondSudo = bot_data:scard(XBOT.."MARTEN:SecondSudo:")
local ListSudoBot = bot_data:scard(XBOT.."MARTEN:SudoBot:")
local ListOwner = bot_data:scard(XBOT.."MARTEN:Owner:"..msg.chat_id_)
local ListBasicConstructor = bot_data:scard(XBOT.."MARTEN:BasicConstructor:"..msg.chat_id_)
local ListConstructor = bot_data:scard(XBOT.."MARTEN:Constructor:"..msg.chat_id_)
local ListManagers = bot_data:scard(XBOT.."MARTEN:Managers:"..msg.chat_id_)
local ListAdmins = bot_data:scard(XBOT.."MARTEN:Admins:"..msg.chat_id_)
local ListVipMem = bot_data:scard(XBOT.."MARTEN:VipMem:"..msg.chat_id_)
local ListCleaner = bot_data:scard(XBOT.."MARTEN:Cleaner:"..msg.chat_id_)
local inline = {
	{{text="• للاساسسين {"..ListSudo.."} •",callback_data="/TagSudo:"..msg.sender_user_id_},{text="• للثانويين {"..ListSecondSudo.."} •",callback_data="/TagSecondSudo:"..msg.sender_user_id_}},
	{{text="• للمطورين {"..ListSudoBot.."} •",callback_data="/TagSudoBot:"..msg.sender_user_id_}},
	{{text="• المالكين {"..ListOwner.."} •",callback_data="/TagOwner:"..msg.sender_user_id_},{text="• المنشئين الاساسين {"..ListBasicConstructor.."} •",callback_data="/TagBasicConstructor:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructor:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagers:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdmins:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMem:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleaner:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if Admin(msg) then
if text == "تاك" then
local Text = '*⌯︙اختر نوع التاك ↫ ⤈ 🔍*'
local Tagall = 'TagAll:'..msg.sender_user_id_..''
bot_data:set(XBOT.. ''..Tagall..'' ,(msg.id_/2097152/0.5))
local ListSudo = bot_data:scard(XBOT.."MARTEN:MARTENSudo:")
local ListSecondSudo = bot_data:scard(XBOT.."MARTEN:SecondSudo:")
local ListSudoBot = bot_data:scard(XBOT.."MARTEN:SudoBot:")
local ListOwner = bot_data:scard(XBOT.."MARTEN:Owner:"..msg.chat_id_)
local ListBasicConstructor = bot_data:scard(XBOT.."MARTEN:BasicConstructor:"..msg.chat_id_)
local ListConstructor = bot_data:scard(XBOT.."MARTEN:Constructor:"..msg.chat_id_)
local ListManagers = bot_data:scard(XBOT.."MARTEN:Managers:"..msg.chat_id_)
local ListAdmins = bot_data:scard(XBOT.."MARTEN:Admins:"..msg.chat_id_)
local ListVipMem = bot_data:scard(XBOT.."MARTEN:VipMem:"..msg.chat_id_)
local ListCleaner = bot_data:scard(XBOT.."MARTEN:Cleaner:"..msg.chat_id_)
keyboard = {} 
if Sudo(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• للاساسسين {"..ListSudo.."} •",callback_data="/TagSudoTag:"..msg.sender_user_id_},{text="• للثانويين {"..ListSecondSudo.."} •",callback_data="/TagSecondSudoTag:"..msg.sender_user_id_}},
	{{text="• للمطورين {"..ListSudoBot.."} •",callback_data="/TagSudoBotTag:"..msg.sender_user_id_}},
	{{text="• المالكين {"..ListOwner.."} •",callback_data="/TagOwnerTag:"..msg.sender_user_id_},{text="• المنشئين الاساسين {"..ListBasicConstructor.."} •",callback_data="/TagBasicConstructorTag:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructorTag:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagersTag:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
} 
elseif MARTENSudo(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• للاساسسين {"..ListSudo.."} •",callback_data="/TagSudoTag:"..msg.sender_user_id_},{text="• للثانويين {"..ListSecondSudo.."} •",callback_data="/TagSecondSudoTag:"..msg.sender_user_id_}},
	{{text="• للمطورين {"..ListSudoBot.."} •",callback_data="/TagSudoBotTag:"..msg.sender_user_id_}},
	{{text="• المالكين {"..ListOwner.."} •",callback_data="/TagOwnerTag:"..msg.sender_user_id_},{text="• المنشئين الاساسين {"..ListBasicConstructor.."} •",callback_data="/TagBasicConstructorTag:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructorTag:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagersTag:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif SecondSudo(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• للاساسسين {"..ListSudo.."} •",callback_data="/TagSudoTag:"..msg.sender_user_id_},{text="• للثانويين {"..ListSecondSudo.."} •",callback_data="/TagSecondSudoTag:"..msg.sender_user_id_}},
	{{text="• للمطورين {"..ListSudoBot.."} •",callback_data="/TagSudoBotTag:"..msg.sender_user_id_}},
	{{text="• المالكين {"..ListOwner.."} •",callback_data="/TagOwnerTag:"..msg.sender_user_id_},{text="• المنشئين الاساسين {"..ListBasicConstructor.."} •",callback_data="/TagBasicConstructorTag:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructorTag:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagersTag:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif SudoBot(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• للاساسسين {"..ListSudo.."} •",callback_data="/TagSudoTag:"..msg.sender_user_id_},{text="• للثانويين {"..ListSecondSudo.."} •",callback_data="/TagSecondSudoTag:"..msg.sender_user_id_}},
	{{text="• للمطورين {"..ListSudoBot.."} •",callback_data="/TagSudoBotTag:"..msg.sender_user_id_}},
	{{text="• المالكين {"..ListOwner.."} •",callback_data="/TagOwnerTag:"..msg.sender_user_id_},{text="• المنشئين الاساسين {"..ListBasicConstructor.."} •",callback_data="/TagBasicConstructorTag:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructorTag:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagersTag:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Owner(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• المالكين {"..ListOwner.."} •",callback_data="/TagOwnerTag:"..msg.sender_user_id_},{text="• المنشئين الاساسين {"..ListBasicConstructor.."} •",callback_data="/TagBasicConstructorTag:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructorTag:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagersTag:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif BasicConstructor(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• المنشئين الاساسين {"..ListBasicConstructor.."} •",callback_data="/TagBasicConstructorTag:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructorTag:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagersTag:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Constructor(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• المنشئين {"..ListConstructor.."} •",callback_data="/TagConstructorTag:"..msg.sender_user_id_}},
	{{text="• المدراء {"..ListManagers.."} •",callback_data="/TagManagersTag:"..msg.sender_user_id_},{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Manager(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• الادمنيه {"..ListAdmins.."} •",callback_data="/TagAdminsTag:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Admin(msg) then
keyboard.inline_keyboard = {
	{{text="• تاك للكل •",callback_data="/TagAll:"..msg.sender_user_id_}},
	{{text="• المميزين {"..ListVipMem.."} •",callback_data="/TagVipMemTag:"..msg.sender_user_id_},{text="• المنظفين {"..ListCleaner.."} •",callback_data="/TagCleanerTag:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
end
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     source -𝐗-     --
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "⌯︙وينكم يالربع \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if bot_data:get(XBOT..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..bot_data:get(XBOT..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     source -𝐗-     --
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
if not bot_data:get(XBOT..'MARTEN:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "⌯︙"..txt[2].." \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if bot_data:get(XBOT..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..bot_data:get(XBOT..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     source -𝐗-     --
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "⌯︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (bot_data:get(XBOT..'MARTEN:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (bot_data:get(XBOT..'MARTEN:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (bot_data:get(XBOT..'MARTEN:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
send(msg.chat_id_, msg.id_, 1, "⌯︙انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n⌯︙مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n⌯︙عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n⌯︙نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     source -𝐗-     --
if text == "تعطيل تفاعلي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر تفاعلي\n•-› X")
bot_data:del(XBOT..'MARTEN:msg:MARTEN'..msg.chat_id_) 
end
if text == "تفعيل تفاعلي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر تفاعلي\n•-› ✓")
bot_data:set(XBOT..'MARTEN:msg:MARTEN'..msg.chat_id_,true)  
end
if bot_data:get(XBOT.."MARTEN:msg:MARTEN"..msg.chat_id_) then
if msg.content_.ID then
get_msg = bot_data:get(XBOT.."MARTEN:msg:MARTEN"..msg.sender_user_id_..":"..msg.chat_id_) or 0
gms = get_msg + 1
bot_data:setex(XBOT..'MARTEN:msg:MARTEN'..msg.sender_user_id_..":"..msg.chat_id_,86400,gms)
end
if text == "تفاعلي" and tonumber(msg.reply_to_message_id_) == 0 then    
get_msg = bot_data:get(XBOT.."MARTEN:msg:MARTEN"..msg.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"⌯︙عدد رسائلك الكلي هو ↬\n"..get_msg.." من الرسائل")
end  
if text == "تفاعله" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
get_msg = bot_data:get(XBOT.."MARTEN:msg:MARTEN"..result.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"⌯︙عدد رسائله الكلي هو ↬\n"..get_msg.." من الرسائل")
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
end
--     source -𝐗-     --
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(bot_data:get(XBOT..'MARTEN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) send(msg.chat_id_, msg.id_, 1, "⌯︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = bot_data:get(XBOT..'MARTEN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  send(msg.chat_id_, msg.id_, 1, "⌯︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then send(msg.chat_id_, msg.id_, 1, '⌯︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then send(msg.chat_id_, msg.id_, 1, "⌯︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text =='مسح جهاتي' or text =='مسح اضافاتي' or text =='حذف جهاتي' or text =='حذف اضافاتي' then bot_data:del(XBOT..'MARTEN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) send(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     source -𝐗-     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') then 
if not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function XxBOt(extra,result,success)
if tonumber(result.id_) == tonumber(2060947106) then 
send(msg.chat_id_, msg.id_, 1, 'دروح عمي روح لا ضحك العالم عليك لا تندك بمطور السورس😏🔥', 1, 'md')  
return false  
end  
if tonumber(result.id_) == tonumber(2076053598) then 
send(msg.chat_id_, msg.id_, 1, 'مبرمج اكس اهينك ما اهينه😏🖕🏿', 1, 'md')
return false  
end  
if result.id_ then  
if tonumber(result.id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔🏌🏼', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(XBoT) then 
send(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md') 
return false  
end  
if bot_data:sismember(XBOT.."MARTEN:MARTENConstructor:"..msg.chat_id_,result.id_) then
send(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md')
return false
end 
local XxBOt = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","دقـيقهۂَ","لـححضهۂ","هسههہ","هَـسۿ ، ثوانيي"} 
send(msg.chat_id_, msg.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
local XxBOt = { "لڪك جرجف @"..username.." احترم اسيادكك لا اكتلڪك وازربب على كبركك،💩🖐🏿","هشش لڪك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
send(msg.chat_id_, result.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'html') 
else  
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,XxBOt)
end
end
--     source -𝐗-     --
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(2060947106) then  
send(msg.chat_id_, msg.id_, 1, 'دروح عمي روح لا ضحك العالم عليك لا تندك بمطور السورس😏🖕🏿', 1, 'md') 
return false
end 
if tonumber(result.sender_user_id_) == tonumber(2076053598) then  
send(msg.chat_id_, msg.id_, 1, 'مبرمج اكس اهينك ما اهينه😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(XBOT) then 
send(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(XBoT) then  
send(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md')
return false
end 
if bot_data:sismember(XBOT.."MARTEN:MARTENConstructor:"..msg.chat_id_,result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md')
return false
end 
local XxBOt = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","دقـيقهۂَ","لـححضهۂ","هسههہ","هَـسۿ ، ثوانيي"} 
send(msg.chat_id_, msg.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
local XxBOt = {"لڪك جرجف احترم اسيادكك لا اكتلڪك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
send(msg.chat_id_, result.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(XBOT) then 
send(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(2060947106) then  
send(msg.chat_id_, result.id_, 1, 'امصه مص مو بس ابوسه هذا مواححح 👅 💋', 1, 'html')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(XBoT) then  
send(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local XxBOt = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","وفـبسہ🤤","؏ـمـريـہٰ تدلل","هسههہ ابوسس","هَـسۿ ، פـياتيہ"} 
send(msg.chat_id_, msg.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
local XxBOt = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
send(msg.chat_id_, result.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(XBOT) then 
send(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(2060947106) then  
send(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(XBoT) then  
send(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك??🏻‍♂️♥️', 1, 'html')
return false
end 
local XxBOt = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","؏ـمـريـہٰ تدلل","شسالفهہ هسههہ اصيحه","هَـسۿ ، פـياتيہ"} 
send(msg.chat_id_, msg.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
local XxBOt = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لڪك ديصيحوك😐🖤"} 
send(msg.chat_id_, result.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     source -𝐗-     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function XxBOt(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(2060947106) then  
send(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end 
if tonumber(result.id_) == tonumber(XBoT) then 
send(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local XxBOt = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","؏ـمـريـہٰ تدلل","شسالفهہ هسههہ اصيحه","هَـسۿ ، פـياتيہ"} 
send(msg.chat_id_, msg.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'md') 
local XxBOt = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لڪك @"..username.." ديصيحوك😐🖤",}
send(msg.chat_id_, result.id_, 1,''..XxBOt[math.random(#XxBOt)]..'', 1, 'html') 
else  
send(msg.chat_id_, msg.id_, 1, '⌯︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,XxBOt)
end
end
end
--     source -𝐗-     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',result.sender_user_id_) then
SoFisudo ='المطورين الاساسيين • ' else SoFisudo ='' end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',result.sender_user_id_) then
secondsudo ='المطورين الثانويين • ' else secondsudo ='' end
if bot_data:sismember(XBOT..'MARTEN:SudoBot:',result.sender_user_id_) then
sudobot ='المطورين • ' else sudobot ='' end
if bot_data:sismember(XBOT..'MARTEN:Owner:'..msg.chat_id_, result.sender_user_id_) then
owner ='المالكين • ' else owner ='' end
if bot_data:sismember(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor ='المنشئين الاساسيين • ' else basicconstructor ='' end
if bot_data:sismember(XBOT..'MARTEN:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor ='المنشئين • ' else constructor ='' end 
if bot_data:sismember(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager ='المدراء • ' else manager ='' end
if bot_data:sismember(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins ='الادمنيه • ' else admins ='' end
if bot_data:sismember(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem ='المميزين • ' else vipmem ='' end
if bot_data:sismember(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner ='المنظفين • ' else cleaner =''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من ↫ ⤈\n~ ( "..SoFisudo..secondsudo..sudobot..owner..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙لم تتم ترقيته مسبقا")  
end
if MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='sudoid' then
bot_data:srem(XBOT..'MARTEN:MARTENSudo:', result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:SecondSudo:', result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:SudoBot:', result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='SoFisudo' then
bot_data:srem(XBOT..'MARTEN:SecondSudo:', result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:SudoBot:', result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='secondsudo' then
bot_data:srem(XBOT..'MARTEN:SudoBot:', result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='sudobot' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='owner' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='SoFiconstructor' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='basicconstructor' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='constructor' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='manager' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',result.id_) then
MARTENsudo ='المطورين الاساسيين • ' else MARTENsudo ='' end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',result.id_) then
secondsudo ='المطورين الثانويين • ' else secondsudo ='' end
if bot_data:sismember(XBOT..'MARTEN:SudoBot:',result.id_) then
sudobot ='المطورين • ' else sudobot ='' end
if bot_data:sismember(XBOT..'MARTEN:Owner:'..msg.chat_id_, result.id_) then
owner ='المالكين • ' else owner ='' end
if bot_data:sismember(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor ='المنشئين الاساسيين • ' else basicconstructor ='' end
if bot_data:sismember(XBOT..'MARTEN:Constructor:'..msg.chat_id_, result.id_) then
constructor ='المنشئين • ' else constructor ='' end 
if bot_data:sismember(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_) then
manager ='المدراء • ' else manager ='' end
if bot_data:sismember(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_) then
admins ='الادمنيه • ' else admins ='' end
if bot_data:sismember(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_) then
vipmem ='المميزين • ' else vipmem ='' end
if bot_data:sismember(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_) then
cleaner ='المنظفين • ' else cleaner =''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من ↫ ⤈\n~ ( "..SoFisudo..secondsudo..sudobot..owner..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","⌯︙لم تتم ترقيته مسبقا")  
end 
if MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='sudoid' then
bot_data:srem(XBOT..'MARTEN:MARTENSudo:', result.id_)
bot_data:srem(XBOT..'MARTEN:SecondSudo:', result.id_)
bot_data:srem(XBOT..'MARTEN:SudoBot:', result.id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='SoFisudo' then
bot_data:srem(XBOT..'MARTEN:SecondSudo:', result.id_)
bot_data:srem(XBOT..'MARTEN:SudoBot:', result.id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='secondsudo' then
bot_data:srem(XBOT..'MARTEN:SudoBot:', result.id_)
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='sudobot' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='owner' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='SoFiconstructor' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='basicconstructor' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='constructor' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_, result.id_)
elseif MARTENDelAll(msg.sender_user_id_,msg.chat_id_) =='manager' then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, result.id_)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_, result.id_)
end
else
send(msg.chat_id_, msg.id_, 1, '⌯︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     source -𝐗-     --
--     Set MARTENSudo     --
if Sudo(msg) then
if text ==('اضف مطور اساسي') or text ==('رفع مطور اساسي') and ChCheck(msg) then
function sudo_reply(extra, result, success)
bot_data:sadd(XBOT..'MARTEN:MARTENSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المطورين الاساسيين\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور اساسي @(.*)') or text:match('^رفع مطور اساسي @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور اساسي @(.*)') or text:match('^رفع مطور اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:MARTENSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المطورين الاساسيين\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور اساسي (%d+)') or text:match('^رفع مطور اساسي (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور اساسي (%d+)') or text:match('رفع مطور اساسي (%d+)')
bot_data:sadd(XBOT..'MARTEN:MARTENSudo:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المطورين الاساسيين\n•-› ✓")  
end
--     source -𝐗-     --
--     Rem SecondSudo     --
if text ==('حذف مطور اساسي') or text ==('تنزيل مطور اساسي') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:MARTENSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المطورين الاساسيين\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور اساسي @(.*)') or text:match('^تنزيل مطور اساسي @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور اساسي @(.*)') or text:match('^تنزيل مطور اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:MARTENSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المطورين الاساسيين\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور اساسي (%d+)') or text:match('^تنزيل مطور اساسي (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور اساسي (%d+)') or text:match('تنزيل مطور اساسي (%d+)')
bot_data:srem(XBOT..'MARTEN:MARTENSudo:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المطورين الاساسيين\n•-› X")  
end end
--     source -𝐗-     --
--     Set SecondSudo     --
if MARTENSudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and ChCheck(msg) then
function sudo_reply(extra, result, success)
bot_data:sadd(XBOT..'MARTEN:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المطورين الثانويين\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المطورين الثانويين\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
bot_data:sadd(XBOT..'MARTEN:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المطورين الثانويين\n•-› ✓")  
end
--     source -𝐗-     --
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المطورين الثانويين\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المطورين الثانويين\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
bot_data:srem(XBOT..'MARTEN:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المطورين الثانويين\n•-› X")  
end end
--     source -𝐗-     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and ChCheck(msg) then
function sudo_reply(extra, result, success)
bot_data:sadd(XBOT..'MARTEN:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المطورين\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المطورين\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
bot_data:sadd(XBOT..'MARTEN:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المطورين\n•-› ✓")  
end
--     source -𝐗-     --
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المطورين\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المطورين\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
bot_data:srem(XBOT..'MARTEN:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المطورين\n•-› X")  
end end
--     source -𝐗-     --
--   Set MARTENConstructor   --
if ChatType =='sp' or ChatType =='gp'  then
if SudoBot(msg) then
if text ==('رفع مالك') and ChCheck(msg) then
function raf_reply(extra, result, success)
bot_data:sadd(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه مالك\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مالك @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه مالك\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مالك (%d+)') and ChCheck(msg) then
local user = text:match('رفع مالك (%d+)')
bot_data:sadd(XBOT..'MARTEN:Owner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه مالك\n•-› ✓")  
end
--     source -𝐗-     --
--   Rem MARTENConstructor   --
if text ==('تنزيل مالك') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
send(msg.chat_id_, msg.id_, 1, '⌯︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:MARTENConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من المالكين\n•-› X")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^تنزيل مالك @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
send(msg.chat_id_, msg.id_, 1, '⌯︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,result.id_)
bot_data:srem(XBOT..'MARTEN:MARTENConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من المالكين\n•-› X")  
end end end
end,nil)
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مالك (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مالك (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
send(msg.chat_id_, msg.id_, 1, '⌯︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
bot_data:srem(XBOT..'MARTEN:Owner:'..msg.chat_id_,user)
bot_data:srem(XBOT..'MARTEN:MARTENConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من المالكين\n•-› X")  
end end end
end,nil)
end end
--     source -𝐗-     --
--  Set BasicConstructor  --
if Owner(msg) then
if text ==('رفع منشئ اساسي') and ChCheck(msg) then
function raf_reply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه منشئ اساسي\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه منشئ اساسي\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه منشئ اساسي\n•-› ✓")  
end
--     source -𝐗-     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله منشئ اساسي\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله منشئ اساسي\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
bot_data:srem(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله منشئ اساسي\n•-› X")  
end end
if text ==('رفع منشئ اساسي') and not Owner(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمالكين والمطورين فقط', 1, 'md')
end
--     source -𝐗-     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and ChCheck(msg) then
function raf_reply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المنشئين\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المنشئين\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المنشئين\n•-› ✓")  
end
--     source -𝐗-     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المنشئين\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المنشئين\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ (%d+)')
bot_data:srem(XBOT..'MARTEN:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المنشئين\n•-› X")  
end 
end
--     source -𝐗-     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المدراء\n•-› ✓")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المدراء\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المدراء\n•-› ✓")  
end
--     source -𝐗-     --
--       Rem Manager      --
if text ==('تنزيل مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المدراء\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المدراء\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير (%d+)')
bot_data:srem(XBOT..'MARTEN:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المدراء\n•-› X")  
end 
--     source -𝐗-     --
--       Set Cleaner      --
if text ==('رفع منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المنظفين\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المنظفين\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and ChCheck(msg) then
local user = text:match('رفع منظف (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المنظفين\n•-› ✓")  
end
--     source -𝐗-     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المنظفين\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المنظفين\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منظف (%d+)')
bot_data:srem(XBOT..'MARTEN:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المنظفين\n•-› X")  
end end
--     source -𝐗-     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الادمنيه\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة الادمنيه\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة الادمنيه\n•-› ✓")  
end
--     source -𝐗-     --
--        Rem admin       --
if text ==('تنزيل ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الادمنيه\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة الادمنيه\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن (%d+)')
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة الادمنيه\n•-› X")  
end end
--     source -𝐗-     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المميزين\n•-› ✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المميزين\n•-› ✓")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
bot_data:sadd(XBOT..'MARTEN:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المميزين\n•-› ✓")  
end
--     source -𝐗-     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المميزين\n•-› X")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المميزين\n•-› X")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز (%d+)')
bot_data:srem(XBOT..'MARTEN:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المميزين\n•-› X")  
end end 
--     source -𝐗-     --
if MARTENConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..XBOT)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه مشرف في المجموعه\n•-› ✓")  
else
send(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..XBOT)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من مشرفين المجموعه\n•-› X")  
else
send(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..XBOT)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه مشرف في جميع الصلاحيات\n•-› ✓")  
else
send(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^رفع مشرف (.*)$")) and ChCheck(msg) then
local MARTEN = text:match("^رفع مشرف (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..XBOT)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه مشرف بالمجموعة\n•-› ✓")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..MARTEN)
else
send(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^ضع لقب (.*)$")) and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) and SecondSudo(msg) then
local MARTEN = text:match("^وضع لقب (.*)$") or text:match("^ضع لقب (.*)$")
function start_function(extra, result, success)
local chek = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..XBOT)
local getInfo = JSON.decode(chek)
if getInfo.result.can_promote_members == false then
send(msg.chat_id_, msg.id_,'⌯︙لا يمكنني تعديل  او وضع لقب ليس لدي صلاحيه\n ⌯︙قم بترقيتي جميع الصلاحيات او صلاحية اضافه مشرف ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n⌯︙ العضو ↫ ['..data.first_name_..'](t.me/'..(data.username_ or 'S0DRG')..') '
status  = '\n⌯︙ الايدي ↫ ( `'..result.sender_user_id_..'` )\n⌯︙تم اضافه ↫ ( '..MARTEN..' ) كلقب له\n•-› ✓'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..MARTEN)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == ("حذف لقب") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) and SecondSudo(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙العضو ↫ ['..data.first_name_..'](t.me/'..(data.username_ or 'SrcX_B0T')..')'
status  = '\n ⌯︙الايدي ↫ `'..result.sender_user_id_..'`\n ⌯︙ تم حذف لقبه من الكروب\n•-› X'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^حذف لقب @(.*)$") and ChCheck(msg) and SecondSudo(msg) then
local username = text:match("^حذف لقب @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n ⌯︙العضو ↫ ['..result.title_..'](t.me/'..(username or 'SrcX_B0T')..')'
status  = '\n ⌯︙ تم حذف لقبه من الكروب\n•-› X'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '⚠¦ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text =='لقبه' and ChCheck(msg) then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'⌯︙ليس لديه لقب هنا') 
else
send(msg.chat_id_, msg.id_,'⌯︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text =='لقبي' and ChCheck(msg) then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'⌯︙ليس لديك لقب هنا') 
else
send(msg.chat_id_, msg.id_,'⌯︙لقبك ↫ '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
--     source -𝐗-     --
if text == "راسلني" or text == "بوت تعال خاص" then
rpl = {"ها هلاو","انطق","كول"};
sender = rpl[math.random(#rpl)]
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' .. URL.escape(sender))
local XxBOt =  {"شوف خاصك 🤭♥️","جييتك" }
local XBoT = XxBOt[math.random(#XxBOt)]
send(msg.chat_id_, msg.id_, 1, XBoT, 1, 'md')
end
--     source -𝐗-     --
if text == "الساعه" or text == "الساعة" or text =="الوقت" or text =="الؤقت" and ChCheck(msg) then
local Time = "\n⌯︙صباح ~ (AM)\n⌯︙مساء ~ (PM)\n⌯︙بـ توقيت بغداد\n⌯︙الساعه الان : "..os.date("~%I:%M~(%p)")
send(msg.chat_id_, msg.id_, 1,Time , 1, 'mb')
end
if text == "التاريخ" then
local Date =  "\n⌯︙التاريخ : " ..os.date("%Y/%m/%d")
send(msg.chat_id_, msg.id_, 1,Date , 1, 'mb')
end
--     source -𝐗-     --
if text == "صلاحيتي" or text == "صلاحياتي" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('صلاحيته') or text ==('صلاحياته') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')) and ChCheck(msg) then
local username = text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^صلاحيته (%d+)') or text:match('^صلاحياته (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('صلاحيته (%d+)') or text:match('صلاحياته (%d+)')
Validity(msg,ValidityId)  
end
--     source -𝐗-     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$") or text:match("^↫ اخفاء الكيبورد ⌯$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end end end
--     source -𝐗-     --
if MARTENConstructor(msg) then
if text == "تفعيل الحظر" and ChCheck(msg) or text == "تفعيل الطرد" and ChCheck(msg) then
bot_data:del(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر الطرد و الحظر\n•-› ✓")
end
if text == "تعطيل الحظر" and ChCheck(msg) or text == "تعطيل الطرد" and ChCheck(msg) then
bot_data:set(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_,"true")
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر الطرد و الحظر\n•-› X")
end
if text == "تفعيل الكتم" and ChCheck(msg) or text == "تفعيل التقييد" and ChCheck(msg) then
bot_data:del(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر الكتم و التقيد\n•-› ✓")
end
if text == "تعطيل الكتم" and ChCheck(msg) or text == "تعطيل التقييد" and ChCheck(msg) then
bot_data:set(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_,"true")
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر الكتم و التقيد\n•-› X")
end
end
if MARTENConstructor(msg) then
if text == "تفعيل الرفع" and ChCheck(msg) or text == "تفعيل الترقيه" and ChCheck(msg) then
bot_data:del(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تفعيل رفع ↫ المنشئ الاساسي • المنشئ • المدير • الادمن • المميز\n•-› ✓', 1, 'md')
end
if text == "تعطيل الرفع" and ChCheck(msg) or text == "تعطيل الترقيه" and ChCheck(msg) then
bot_data:set(XBOT.."MARTEN:Lock:ProSet"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تعطيل رفع ↫ المنشئ الاساسي • المنشئ • المدير • الادمن • المميز\n•-› X', 1, 'md')
end
end
--     source -𝐗-     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه\n•-› X')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
local Text = "⌯︙تم طرده من المجموعه" 
local inline = {{{text="• الغاء حظر •",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه\n•-› X')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم طرده من المجموعه")  
end,nil)
end
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه\n•-› X')
return false
end
if RankChecking(user, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم طرده من المجموعه")  
end,nil)
end
end
end 
--     source -𝐗-     --
--          Ban           --
if Admin(msg) then
if text ==('حضر') or text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه\n•-› X')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
bot_data:sadd(XBOT..'MARTEN:Ban:'..msg.chat_id_, result.sender_user_id_)
local Text = "⌯︙تم حظره من المجموعه" 
local inline = {{{text="• الغاء حظر •",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^حضر @(.*)') or text:match('^حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر @(.*)') or text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه\n•-› X')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
bot_data:sadd(XBOT..'MARTEN:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم حظره من المجموعه")  
end,nil) 
end
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^حضر (%d+)') or text:match('^حظر (%d+)')) and ChCheck(msg) then
local user = text:match('حضر (%d+)') or text:match('حظر (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه\n•-› X')
return false
end
if RankChecking(user, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
bot_data:sadd(XBOT..'MARTEN:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم حظره من المجموعه")  
end,nil) 
end
end
--     source -𝐗-     --
--         UnBan          --
if text ==('الغاء الحظر') or text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء حظره من المجموعه")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^الغاء الحظر (%d+)') or text:match('^الغاء حظر (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الحظر (%d+)') or text:match('الغاء حظر (%d+)')
bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء حظره من المجموعه")  
end 
end 
--     source -𝐗-     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد\n•-› X')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو بالفعل مكتوم من المجموعه")  
else
bot_data:sadd(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.sender_user_id_)
local Text = "⌯︙تم كتمه من المجموعه" 
local inline = {{{text="• الغاء كتم •",callback_data=msg.sender_user_id_..":UnMute:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","⌯︙هو بالفعل مكتوم من المجموعه")  
else
bot_data:sadd(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم كتمه من المجموعه")  
end
end
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد\n•-› X')
return false
end
if RankChecking(user, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","⌯︙هو بالفعل مكتوم من المجموعه")  
else
bot_data:sadd(XBOT..'MARTEN:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم كتمه من المجموعه")  
end
end
end
--     source -𝐗-     --
--         UnMute         --
if text ==('الغاء الكتم') or text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس مكتوم لالغاء كتمه")  
else
bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","⌯︙هو ليس مكتوم لالغاء كتمه")  
else
bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء كتمه من المجموعه")  
end
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^الغاء الكتم (%d+)') or text:match('^الغاء كتم (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الكتم (%d+)') or text:match('الغاء كتم (%d+)')
if not bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","⌯︙هو ليس مكتوم لالغاء كتمه")  
else
bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء كتمه من المجموعه")  
end
end 
end 
--     source -𝐗-     --
--          Tkeed           --
if Admin(msg) then
if text ==('تقييد') or text ==('تقيد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد\n•-› X')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
local Text = "⌯︙تم تقيده من المجموعه" 
local inline = {{{text="• الغاء تقيد •",callback_data=msg.sender_user_id_..":UnTkeed:"..result.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')
function TkeedUser(extra,result,success)
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد\n•-› X')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تقيده من المجموعه")  
end
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^تقييد (%d+)') or text:match('^تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('تقييد (%d+)') or text:match('تقيد (%d+)')
if not MARTENConstructor(msg) and bot_data:get(XBOT.."MARTEN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد\n•-› X')
return false
end
if RankChecking(user, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم تقيده من المجموعه")  
end
end
--     source -𝐗-     --
--         UnTkeed          --
if text ==('الغاء تقييد') or text ==('الغاء تقيد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء تقيده من المجموعه")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^الغاء تقييد (%d+)') or text:match('^الغاء تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)') or text:match('الغاء تقيد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء تقيده من المجموعه")  
end
end 
end
--     source -𝐗-     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('حضر عام') or text ==('حظر عام') and ChCheck(msg) then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',result.sender_user_id_) and not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',result.sender_user_id_) and not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
bot_data:sadd(XBOT..'MARTEN:BanAll:', result.sender_user_id_)
local Text = "⌯︙تم حظره عام من المجموعات" 
local inline = {{{text="• الغاء العام •",callback_data=msg.sender_user_id_..":UnAll:"..result.sender_user_id_},{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',result.id_) and not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',result.id_) and not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
bot_data:sadd(XBOT..'MARTEN:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم حظره عام من المجموعات")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^حضر عام (%d+)') or text:match('^حظر عام (%d+)')) and ChCheck(msg) then
local user = text:match('حضر عام (%d+)') or text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',user) and not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',user) and not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
bot_data:sadd(XBOT..'MARTEN:BanAll:', user)
ReplyStatus(msg,user,"Reply","⌯︙تم حظره عام من المجموعات")  
end
--     source -𝐗-     --
--         MuteAll        --
if text ==('كتم عام') and ChCheck(msg) then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',result.sender_user_id_) and not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',result.sender_user_id_) and not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
bot_data:sadd(XBOT..'MARTEN:MuteAll:', result.sender_user_id_)          
local Text = "⌯︙تم كتمه عام من المجموعات" 
local inline = {{{text="• الغاء العام •",callback_data=msg.sender_user_id_..":UnAll:"..result.sender_user_id_},{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') and ChCheck(msg) then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',result.id_) and not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',result.id_) and not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
if result.id_ then
bot_data:sadd(XBOT..'MARTEN:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم كتمه عام من المجموعات")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') and ChCheck(msg) then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:MARTENSudo:',user) and not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if bot_data:sismember(XBOT..'MARTEN:SecondSudo:',user) and not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
bot_data:sadd(XBOT..'MARTEN:MuteAll:', user)
ReplyStatus(msg,user,"Reply","⌯︙تم كتمه عام من المجموعات")  
end
--     source -𝐗-     --
--         UnAll          --
if text ==('الغاء عام') or text ==('الغاء العام') and ChCheck(msg) then
function UnAllReply(extra, result, success)
bot_data:srem(XBOT..'MARTEN:BanAll:', result.sender_user_id_)
bot_data:srem(XBOT..'MARTEN:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
bot_data:srem(XBOT..'MARTEN:BanAll:', result.id_)
bot_data:srem(XBOT..'MARTEN:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^الغاء عام (%d+)') or text:match('^الغاء العام (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء عام (%d+)') or text:match('الغاء العام (%d+)')
bot_data:srem(XBOT..'MARTEN:BanAll:', user)
bot_data:srem(XBOT..'MARTEN:MuteAll:', user)
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     source -𝐗-     --
if (text == "تغير المطور الاساسي" or text == "نقل ملكيه البوت" or text == "تغيير المطور الاساسي" or text == "↫ تغير المطور الاساسي ⌯") and msg.reply_to_message_id_ == 0 and Sudo(msg) and ChCheck(msg) then 
send(msg.chat_id_, msg.id_,'⌯︙يجب التاكد ان المطور الجديد ارسل start لخاص البوت بعد ذلك يمكنك ارسال ايدي المطور')
bot_data:setex(XBOT.."MARTEN:EditDev"..msg.sender_user_id_,300,true)
end
if bot_data:get(XBOT.."MARTEN:EditDev"..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,'⌯︙تم الغاء امر تغير المطور الاساسي')
bot_data:del(XBOT.."MARTEN:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
bot_data:del(XBOT.."MARTEN:EditDev"..msg.sender_user_id_)
bot_data:set(XBOT.."MARTEN:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser ='\n⌯︙المعرف ↫ [@'..dp.username_..']' else DevUser ='' end
local Text ='⌯︙الايدي ↫ '..dp.id_..DevUser..'\n⌯︙الاسم ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')\n⌯︙تم حفظ المعلومات بنجاح\n⌯︙استخدم الازرار للتاكيد ↫ ⤈'
local inline = {{{text="• نعم •",callback_data="/setyes"},{text="• لا •",callback_data="/setno"}}} 
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
else
send(msg.chat_id_, msg.id_,"⌯︙المعلومات خاطئه قم بالتاكد واعد المحاوله")
bot_data:del(XBOT.."MARTEN:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المطايه\n•-› ✓") 
bot_data:sadd(XBOT..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس مطي ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المطايه\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع حاته$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function HaTa_by_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:HaTa:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي حاته شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الحاتات\n•-› ✓") 
bot_data:sadd(XBOT..'User:HaTa:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,HaTa_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل حاته$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function HaTa_by_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:HaTa:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ليس حاته ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:HaTa:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الحاتات\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,HaTa_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع صاك$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function hlo_by_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:hlo:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو صاك شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الصاكين\n•-› ✓") 
bot_data:sadd(XBOT..'User:hlo:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,hlo_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل صاك$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function hlo_by_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:hlo:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس صاك ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:hlo:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الصاكين\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,hlo_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع صخل$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Sakl_by_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Sakl:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو صخل شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الصخوله\n•-› ✓") 
bot_data:sadd(XBOT..'User:Sakl:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Sakl_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل صخل$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Sakl_by_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Sakl:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس صخل ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Sakl:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الصخوله\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Sakl_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع جلب$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Dog_by_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Dog:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو جلب شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الجلاب\n•-› ✓") 
bot_data:sadd(XBOT..'User:Dog:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Dog_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل جلب$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Dog_by_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Dog:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس جلب ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Dog:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الجلاب\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Dog_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع ضلعه$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_Gir_lby_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ضلعه شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الضلعات\n•-› ✓") 
bot_data:sadd(XBOT..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_Gir_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل ضلعه$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_Gir_lby_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ليست ضلعه ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الضلعات\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_Gir_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع ضلع$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_by_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Bro:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ضلع شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الضلوع\n•-› ✓") 
bot_data:sadd(XBOT..'User:Bro:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل ضلع$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_by_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Bro:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس ضلع ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Bro:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الضلوع\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_by_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع بقره$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bakra_lby_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Bakra:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي بقره شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الهوايش\n•-› ✓") 
bot_data:sadd(XBOT..'User:Bakra:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bakra_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل بقره$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bakra_lby_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Bakra:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ليست بقره ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Bakra:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الهوايش\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bakra_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع طلي$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Tale_lby_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Tale:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو طلي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الطليان\n•-› ✓") 
bot_data:sadd(XBOT..'User:Tale:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Tale_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل طلي$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Tale_lby_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Tale:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس طلي ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Tale:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الطليان\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Tale_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع زاحف$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Zahf_lby_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Zahf:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو زاحف شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الزواحف\n•-› ✓") 
bot_data:sadd(XBOT..'User:Zahf:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Zahf_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل زاحف$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Zahf_lby_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Zahf:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس زاحف ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Zahf:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الزواحف\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Zahf_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع جريذي$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Jred_lby_reply(extra, result, success)
if bot_data:sismember(XBOT..'User:Jred:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو جريذي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الجريذيه\n•-› ✓") 
bot_data:sadd(XBOT..'User:Jred:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Jred_lby_reply)
end end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل جريذي$") and not bot_data:get(XBOT..'MARTEN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Jred_lby_reply(extra, result, success)
if not bot_data:sismember(XBOT..'User:Jred:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس جريذي ليتم تنزيله") 
else
bot_data:srem(XBOT..'User:Jred:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الجريذيه\n•-› X") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Jred_lby_reply)
end end
--     source -𝐗-     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تقيده لمدة ↫ "..mutept.." د") 
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تقيده لمدة ↫ "..mutept.." س") 
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تقيده لمدة ↫ "..mutept.." ي") 
bot_data:sadd(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     source -𝐗-     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
bot_data:set('XxBOt:'..XBOT..'id:user'..msg.chat_id_,TXT)  
bot_data:setex('XxBOt:'..XBOT.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل عدد الرسائل الان \n⌯︙ارسل الغاء لالغاء الامر ", 1, "md")
send(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function Reply(extra, result, success)
bot_data:del(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
bot_data:incrby(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
bot_data:set('XxBOt:'..XBOT..'ids:user'..msg.chat_id_,TXT)  
bot_data:setex('XxBOt:'..XBOT.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل عدد النقاط الان \n⌯︙ارسل الغاء لالغاء الامر ", 1, "md")
send(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function Reply(extra, result, success)
bot_data:incrby(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if bot_data:get(XBOT..'MARTEN:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then bot_data:sadd(XBOT.."MARTEN:cleaner"..msg.chat_id_, msg.id_) else bot_data:sadd(XBOT.."MARTEN:cleaner"..msg.chat_id_, msg.id_) end end end
if bot_data:get(XBOT..'MARTEN:Lock:CleanNum'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then bot_data:sadd(XBOT.."MARTEN:cleanernum"..msg.chat_id_, msg.id_) else bot_data:sadd(XBOT.."MARTEN:cleanernum"..msg.chat_id_, msg.id_) end end end
if bot_data:get(XBOT..'MARTEN:Lock:CleanMusic'..msg.chat_id_) then if msg.content_.voice_ or msg.content_.audio_ then if msg.reply_to_message_id_ ~= 0 then bot_data:sadd(XBOT.."MARTEN:cleanermusic"..msg.chat_id_, msg.id_) else bot_data:sadd(XBOT.."MARTEN:cleanermusic"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if bot_data:sismember(XBOT.."MARTEN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
bot_data:set(XBOT..'MARTEN:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تثبيت الرسالة")
return false  
end
if data.code_ == 6 then
send(msg.chat_id_, msg.id_, 1,'⌯︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     source -𝐗-     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:VipMem:'..msg.chat_id_)
text = "⌯︙قائمة المميزين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مميزين*"
end
local inline = {{{text="• مسح المميزين •",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end end
--     source -𝐗-     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local SoFi =  'MARTEN:Admins:'..msg.chat_id_
local List = bot_data:smembers(XBOT..SoFi)
text = "⌯︙قائمة الادمنيه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ادمنيه*"
end
local inline = {{{text="• مسح الادمنيه •",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end end
--     source -𝐗-     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:Managers:'..msg.chat_id_)
text = "⌯︙قائمة المدراء ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مدراء*"
end
local inline = {{{text="• مسح المدراء •",callback_data="/DelManager:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end 
if text == "المنظفين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:Cleaner:'..msg.chat_id_)
text = "⌯︙قائمة المنظفين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد منظفين*"
end
local inline = {{{text="• مسح المنظفين •",callback_data="/DelCleanr:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end end
--     source -𝐗-     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:Constructor:'..msg.chat_id_)
text = "⌯︙قائمة المنشئين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد منشئين*"
end
local inline = {{{text="• مسح المنشئين •",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end end
--     source -𝐗-     --
if Owner(msg) then
if text == "المالكين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:Owner:'..msg.chat_id_)
text = "⌯︙قائمة المالكين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مالكين*"
end 
local inline = {{{text="• مسح المالكين •",callback_data="/DelOwner:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_)
text = "⌯︙قائمة المنشئين الاساسيين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد منشئين اساسيين*"
end
local inline = {{{text="• مسح المنشئين الاساسيين •",callback_data="/DelBasicConstructor:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
send(msg.chat_id_, msg.id_, 1, "⌯︙حساب المنشئ محذوف", 1, "md")
return false  
end
tdcli_function ({ID="GetUserProfilePhotos",user_id_=Manager_id,offset_=0,limit_=1},function(arg,getpro) 
if getpro.photos_[0] then
local bio = '['..GetBio(dp.id_,msg.chat_id_)..']'
local FixName = (dp.first_name_):gsub('#','')
Text = "*⌯︙Owner Name ↬ * ["..dp.first_name_.."](T.me/"..dp.username_..")\n*⌯︙Owner User ↬* [@"..dp.username_.."]\n*⌯︙Owner id ↬* ["..dp.id_.."](T.me/"..dp.username_..")\n*⌯︙Owner Bio ↬* "..bio.."\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"
keyboard = {} 
keyboard.inline_keyboard = {{{text='• '..FixName..' •',url="t.me/"..dp.username_ or SrcX_B0T}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Text)..'&photo='..getpro.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
send(msg.chat_id_, msg.id_,Text,1, 'md')
end
end,nil)   
end,nil)   
end
end
end,nil)  
end
--     source -𝐗-     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:Muted:'..msg.chat_id_)
text = "⌯︙قائمة المكتومين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مكتومين*"
end
local inline = {{{text="• مسح المكتومين •",callback_data="/DelMute:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text == "المقيدين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:Tkeed:'..msg.chat_id_)
text = "⌯︙قائمة المقيدين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مقيدين*"
end
local inline = {{{text="• مسح المقيدين •",callback_data="/DelKeed:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:Ban:'..msg.chat_id_)
text = "⌯︙قائمة المحظورين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد محظورين*"
end
local inline = {{{text="• مسح المحظورين •",callback_data="/DelBan:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Donky:'..msg.chat_id_)
text = "⌯︙قائمة مطاية المجموعه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مطايه كلها اوادم*"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الحاتات" and ChCheck(msg) or text == "حاتات" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:HaTa:'..msg.chat_id_)
text = "⌯︙قائمة حاتات المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد حاتات كلهن محلوات* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الصاكين" and ChCheck(msg) or text == "صاكين" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:hlo:'..msg.chat_id_)
text = "⌯︙قائمة صاكين المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد صاكين كلهم جكمين* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الصخوله" and ChCheck(msg) or text == "صخولة" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Sakl:'..msg.chat_id_)
text = "⌯︙قائمة الصخوله المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد الصخوله كلهم جكمين* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الجلاب" and ChCheck(msg) or text == "جلاب" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Dog:'..msg.chat_id_)
text = "⌯︙قائمة الجلاب المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد جلاب كلهم ملقحين* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "القورده" and ChCheck(msg) or text == "قروده" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Monkey:'..msg.chat_id_)
text = "⌯︙قائمة القورده المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد قروده كلهم مؤدبين* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الضلوع" and ChCheck(msg) or text == "ضلوعي" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Bro:'..msg.chat_id_)
text = "⌯︙قائمة الضلوع المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ضلوع راحو وي الطيبين* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الضلعات" and ChCheck(msg) or text == "ضلعاتي" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Bro:Girl'..msg.chat_id_)
text = "⌯︙قائمة الضلعات المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ضلعات كلهن برابيك* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الهوايش" and ChCheck(msg) or text == "البقرات" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Bakra:'..msg.chat_id_)
text = "⌯︙قائمة البقرات المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد بقرات كلهن ضعيفات ومبيهن حليب* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الطليان" and ChCheck(msg) or text == "طليان" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Tale:'..msg.chat_id_)
text = "⌯︙قائمة طليان المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد طليان كلهم نغوله مينقطون* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الزواحف" and ChCheck(msg) or text == "زواحف" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Zahf:'..msg.chat_id_)
text = "⌯︙قائمة زواحف المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد زواحف كلهم ثكال* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "الجريذيه" and ChCheck(msg) or text == "جريذيه" and ChCheck(msg) then
local List = bot_data:smembers(XBOT..'User:Jred:'..msg.chat_id_)
text = "⌯︙قائمة الجريذيه المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد جريذيه* 😹💔"
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     source -𝐗-     --
if text == "قائمه المنع" and MARTENConstructor(msg) and ChCheck(msg) then
local List = bot_data:hkeys(XBOT..'MARTEN:Filters:'..msg.chat_id_)
text = "⌯︙قائمة المنع ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k, v in pairs(List) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #List == 0 then
text = "⌯︙لا توجد كلمات ممنوعه"
end
local inline = {{{text="• مسح المتحركات •",callback_data="/DelGif:"..msg.sender_user_id_},{text="• مسح الملصقات •",callback_data="/DelSticker:"..msg.sender_user_id_}},{{text="• مسح الصور •",callback_data="/DelPhoto:"..msg.sender_user_id_},{text="• مسح الكلمات •",callback_data="/DelTextfilter:"..msg.sender_user_id_}},{{text="• مسح قوائم المنع •",callback_data="/DelAllFilter:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end
end 
--     source -𝐗-     --
if text == "المطورين الاساسيين" and ChCheck(msg) and MARTENSudo(msg) or text == "الاساسيين" and MARTENSudo(msg) and ChCheck(msg) or text == "↫ الاساسيين ⌯" and MARTENSudo(msg) and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:MARTENSudo:')
text = "⌯︙قائمة المطورين الاساسيين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين اساسيين*"
end
local inline = {{{text="• مسح الاساسيين •",callback_data="/DelMARTENSudo:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end 
--     source -𝐗-     --
if text == "المطورين الثانويين" and SecondSudo(msg) and ChCheck(msg) or text == "الثانويين" and SecondSudo(msg) and ChCheck(msg) or text == "↫ الثانويين ⌯" and SecondSudo(msg) and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:SecondSudo:')
text = "⌯︙قائمة المطورين الثانويين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
local inline = {{{text="• مسح الثانويين •",callback_data="/DelSecondSudo:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ⌯" and ChCheck(msg) or text == "↫ قائمه العام ⌯" and ChCheck(msg) then 
local BanAll = bot_data:smembers(XBOT..'MARTEN:BanAll:')
local MuteAll = bot_data:smembers(XBOT..'MARTEN:MuteAll:')
if #BanAll ~= 0 then 
text = "⌯︙قائمة المحظورين عام ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(BanAll) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."⌯︙قائمة المكتومين عام ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(MuteAll) do
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "⌯︙*لم يتم حظر او كتم اي عضو*"
end
local inline = {{{text="• مسح قائمه العام •",callback_data="/DelListAll:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end 
--     source -𝐗-     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين ⌯" and ChCheck(msg) then 
local List = bot_data:smembers(XBOT..'MARTEN:SudoBot:')
text = "⌯︙قائمة المطورين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local sudouser = bot_data:get(XBOT..'MARTEN:Sudos'..v) 
local username = bot_data:get(XBOT..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : "..v.." ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين*"
end 
local inline = {{{text="• مسح المطورين •",callback_data="/DelSudoBot:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المالك") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
send(msg.chat_id_, msg.id_, 1, "⌯︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "SrcX_B0T")
send(msg.chat_id_, msg.id_, 1, "⌯︙تم رفع مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
bot_data:sadd(XBOT.."MARTEN:MARTENConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     source -𝐗-     --
if Manager(msg) then
if text =='منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
bot_data:sadd(XBOT.."MARTEN:FilterSteckr"..msg.chat_id_,idsticker)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
bot_data:sadd(XBOT.."MARTEN:FilterPhoto"..msg.chat_id_,photo)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
bot_data:sadd(XBOT.."MARTEN:FilterAnimation"..msg.chat_id_,idanimation)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     source -𝐗-     --
if text =='الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
bot_data:srem(XBOT.."MARTEN:FilterSteckr"..msg.chat_id_,idsticker)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
bot_data:srem(XBOT.."MARTEN:FilterPhoto"..msg.chat_id_,photo)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
bot_data:srem(XBOT.."MARTEN:FilterAnimation"..msg.chat_id_,idanimation)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     source -𝐗-     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل تحويل الصيغ\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Thwel:MARTEN'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل تحويل الصيغ\n•-› X")
bot_data:set(XBOT..'MARTEN:Thwel:MARTEN'..msg.chat_id_,true)  
end
if text =='تحويل' and not bot_data:get(XBOT..'MARTEN:Thwel:MARTEN'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local MARTEN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..MARTEN.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local MARTEN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..MARTEN.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','⌯︙تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local MARTEN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..MARTEN.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"⌯︙تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local MARTEN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..MARTEN.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     source -𝐗-     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..data.id_) or 0)
if bot_data:sismember(XBOT..'MARTEN:BanAll:',result.sender_user_id_) then
Tkeed ='محظور عام'
elseif bot_data:sismember(XBOT..'MARTEN:MuteAll:',result.sender_user_id_) then
Tkeed ='مكتوم عام'
elseif bot_data:sismember(XBOT..'MARTEN:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed ='محظور'
elseif bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed ='مكتوم'
elseif bot_data:sismember(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed ='مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked ='\n⌯︙القيود ↫ '..Tkeed
else 
Tked ='' 
end
if bot_data:sismember(XBOT..'MARTEN:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot ='\n⌯︙عدد الكروبات ↫ '..(bot_data:get(XBOT..'MARTEN:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot ='' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle ='\n⌯︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle ='' 
end
if data.first_name_ == false then 
send(msg.chat_id_, msg.id_, 1,'⌯︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text ='⌯︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\n⌯︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌯︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
send(msg.chat_id_, msg.id_, 1,'⌯︙معرفه ↫ [@'..data.username_..']\n⌯︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌯︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, 1,'⌯︙*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch ='قناة'
local chn ='⌯︙نوع الحساب ↫ ❨ '..ch..' ❩\n⌯︙الايدي ↫ ❨ `'..res.id_..'` ❩\n⌯︙المعرف ↫ ❨ [@'..username..'] ❩\n⌯︙الاسم ↫ ❨ ['..res.title_..'] ❩'
send(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr ='مجموعه'
local grr ='⌯︙نوع الحساب ↫ ❨ '..gr..' ❩\n⌯︙الايدي ↫ ❨ '..res.id_..' ❩\n⌯︙المعرف ↫ ❨ [@'..username..'] ❩\n⌯︙الاسم ↫ ❨ ['..res.title_..'] ❩'
send(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..res.id_) or 0)
if bot_data:sismember(XBOT..'MARTEN:BanAll:',res.id_) then
Tkeed ='محظور عام'
elseif bot_data:sismember(XBOT..'MARTEN:MuteAll:',res.id_) then
Tkeed ='مكتوم عام'
elseif bot_data:sismember(XBOT..'MARTEN:Ban:'..msg.chat_id_,res.id_) then
Tkeed ='محظور'
elseif bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_,res.id_) then
Tkeed ='مكتوم'
elseif bot_data:sismember(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed ='مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked ='\n⌯︙القيود ↫ '..Tkeed
else 
Tked ='' 
end
if bot_data:sismember(XBOT..'MARTEN:SudoBot:',res.id_) and SudoBot(msg) then
sudobot ='\n⌯︙عدد الكروبات ↫ '..(bot_data:get(XBOT..'MARTEN:Sudos'..res.id_) or 0)..'' 
else 
sudobot ='' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle ='\n⌯︙لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle ='' 
end
if data.first_name_ == false then
send(msg.chat_id_, msg.id_, 1,'⌯︙الحساب محذوف', 1, 'md')
return false  end
send(msg.chat_id_, msg.id_, 1,'⌯︙معرفه ↫ [@'..data.username_..']\n⌯︙ايديه ↫ ❨ `'..res.id_..'` ❩\n⌯︙رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
send(msg.chat_id_, msg.id_, 1,'⌯︙لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..iduser) or 0)
if bot_data:sismember(XBOT..'MARTEN:BanAll:',iduser) then
Tkeed ='محظور عام'
elseif bot_data:sismember(XBOT..'MARTEN:MuteAll:',iduser) then
Tkeed ='مكتوم عام'
elseif bot_data:sismember(XBOT..'MARTEN:Ban:'..msg.chat_id_,iduser) then
Tkeed ='محظور'
elseif bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_,iduser) then
Tkeed ='مكتوم'
elseif bot_data:sismember(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,iduser) then
Tkeed ='مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked ='\n⌯︙القيود ↫ '..Tkeed
else 
Tked ='' 
end
if bot_data:sismember(XBOT..'MARTEN:SudoBot:',iduser) and SudoBot(msg) then
sudobot ='\n⌯︙عدد الكروبات ↫ '..(bot_data:get(XBOT..'MARTEN:Sudos'..iduser) or 0)..'' 
else 
sudobot ='' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle ='\n⌯︙لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle ='' 
end
if data.first_name_ == false then
send(msg.chat_id_, msg.id_, 1,'⌯︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text ='⌯︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..iduser..')\n⌯︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌯︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
send(msg.chat_id_, msg.id_, 1,'⌯︙معرفه ↫ [@'..data.username_..']\n⌯︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌯︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     source -𝐗-     --
if text =='كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_,result.sender_user_id_) then muted ='مكتوم' else muted ='غير مكتوم' end
if bot_data:sismember(XBOT..'MARTEN:Ban:'..msg.chat_id_,result.sender_user_id_) then banned ='محظور' else banned ='غير محظور' end
if bot_data:sismember(XBOT..'MARTEN:BanAll:',result.sender_user_id_) then banall ='محظور عام' else banall ='غير محظور عام' end
if bot_data:sismember(XBOT..'MARTEN:MuteAll:',result.sender_user_id_) then muteall ='مكتوم عام' else muteall ='غير مكتوم عام' end
if bot_data:sismember(XBOT..'MARTEN:Tkeed:',result.sender_user_id_) then tkeed ='مقيد' else tkeed ='غير مقيد' end
send(msg.chat_id_, msg.id_, 1, '⌯︙الحظر العام ↫ '..banall..'\n⌯︙الكتم العام ↫ '..muteall..'\n⌯︙الحظر ↫ '..banned..'\n⌯︙الكتم ↫ '..muted..'\n⌯︙التقيد ↫ '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if bot_data:sismember(XBOT..'MARTEN:Muted:'..msg.chat_id_,result.id_) then muted ='مكتوم' else muted ='غير مكتوم' end
if bot_data:sismember(XBOT..'MARTEN:Ban:'..msg.chat_id_,result.id_) then banned ='محظور' else banned ='غير محظور' end
if bot_data:sismember(XBOT..'MARTEN:BanAll:',result.id_) then banall ='محظور عام' else banall ='غير محظور عام' end
if bot_data:sismember(XBOT..'MARTEN:MuteAll:',result.id_) then muteall ='مكتوم عام' else muteall ='غير مكتوم عام' end
if bot_data:sismember(XBOT..'MARTEN:Tkeed:',result.id_) then tkeed ='مقيد' else tkeed ='غير مقيد' end
send(msg.chat_id_, msg.id_, 1, '⌯︙الحظر العام ↫ '..banall..'\n⌯︙الكتم العام ↫ '..muteall..'\n⌯︙الحظر ↫ '..banned..'\n⌯︙الكتم ↫ '..muted..'\n⌯︙التقيد ↫ '..tkeed, 1, 'md')  
else
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text =='رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, '⌯︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,result.sender_user_id_) bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_,result.sender_user_id_) bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_,result.sender_user_id_) bot_data:srem(XBOT..'MARTEN:BanAll:',result.sender_user_id_) bot_data:srem(XBOT..'MARTEN:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,result.sender_user_id_) bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_,result.sender_user_id_) bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, '⌯︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
send(msg.chat_id_, msg.id_, 1, '⌯︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","⌯︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,user) bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_,user) bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_,user) bot_data:srem(XBOT..'MARTEN:BanAll:',user) bot_data:srem(XBOT..'MARTEN:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,user) bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_,user) bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(XBOT) then  
send(msg.chat_id_, msg.id_, 1, '⌯︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
send(msg.chat_id_, msg.id_, 1, '⌯︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,result.id_) bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_,result.id_) bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_,result.id_) bot_data:srem(XBOT..'MARTEN:BanAll:',result.id_) bot_data:srem(XBOT..'MARTEN:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_,result.id_) bot_data:srem(XBOT..'MARTEN:Ban:'..msg.chat_id_,result.id_) bot_data:srem(XBOT..'MARTEN:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     source -𝐗-     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
⌯︙𝐔𝐒𝐄𝐑 ↬ #username 
⌯︙𝐈𝐃 ↬ #id
⌯︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
⌯︙𝐀𝐔𝐓𝐎 ↬ #cont 
⌯︙𝐌𝐀𝐒𝐆 ↬ #msgs
⌯︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
bot_data:set(XBOT.."MARTEN:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم تغير كليشة الايدي")  
end
--     source -𝐗-     --
if SecondSudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
send(msg.chat_id_, msg.id_, 1, '⌯︙رجائا اتبع التعليمات للتعيين \n⌯︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ', 1, 'md')
bot_data:set("XBOT:New:id:"..XBOT..msg.sender_user_id_,'XxBOt')
return "XxBOt"
end
if text and bot_data:get("XBOT:New:id:"..XBOT..msg.sender_user_id_) then 
if text =='الغاء' then   
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الايدي', 1, 'md')
bot_data:del("XBOT:New:id:"..XBOT..msg.sender_user_id_)
return false
end
bot_data:del("XBOT:New:id:"..XBOT..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ كليشة الايدي العامه', 1, 'md')
bot_data:set(XBOT.."MARTEN:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف كليشة الايدي العامه")  
bot_data:del(XBOT.."MARTEN:AllIds:Text")
end
end
--     source -𝐗-     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙رجائا اتبع التعليمات للتعيين \n⌯︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ', 1, 'md')
bot_data:set("XBOT:New:id:"..XBOT..msg.chat_id_..msg.sender_user_id_,'XxBOt')
return "XxBOt"
end
if text and Manager(msg) and bot_data:get("XBOT:New:id:"..XBOT..msg.chat_id_..msg.sender_user_id_) then 
if text =='الغاء' then   
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الايدي', 1, 'md')
bot_data:del("XBOT:New:id:"..XBOT..msg.chat_id_..msg.sender_user_id_)
return false
end
bot_data:del("XBOT:New:id:"..XBOT..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الكليشه الجديده', 1, 'md')
bot_data:set(XBOT.."MARTEN:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف كليشة الايدي")  
bot_data:del(XBOT.."MARTEN:GpIds:Text"..msg.chat_id_)
end
end
--     source -𝐗-     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function XxBOt(extra,SoFi,success)
if SoFi.username_ then username ='@'..SoFi.username_ else username ='لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle ='لا يوجد' end
local function getpro(extra, SoFi, success) 
local msgsday = bot_data:get(XBOT..'MARTEN:UsersMsgs'..XBOT..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = bot_data:get(XBOT..'MARTEN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(bot_data:get(XBOT..'MARTEN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(bot_data:get(XBOT..'MARTEN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(bot_data:get(XBOT..'MARTEN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بكروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if SoFi.photos_[0] then
if not bot_data:get(XBOT..'MARTEN:Lock:Id'..msg.chat_id_) then 
if not bot_data:get(XBOT..'MARTEN:Lock:Id:Photo'..msg.chat_id_) then 
if bot_data:get(XBOT.."MARTEN:AllIds:Text") then
newpicid = bot_data:get(XBOT.."MARTEN:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(SoFi.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "⌯︙"..Description.."\n⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
end 
if not bot_data:get(XBOT.."MARTEN:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, SoFi.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = bot_data:get(XBOT.."MARTEN:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(SoFi.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, SoFi.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if bot_data:get(XBOT.."MARTEN:AllIds:Text") then
newallid = bot_data:get(XBOT.."MARTEN:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(SoFi.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩"
end 
if not bot_data:get(XBOT.."MARTEN:GpIds:Text"..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = bot_data:get(XBOT.."MARTEN:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(SoFi.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
send(msg.chat_id_, msg.id_, 1, '⌯︙عذرا الايدي معطل ', 1, 'md')
end
else
if bot_data:get(XBOT.."MARTEN:AllIds:Text") then
notpicid = bot_data:get(XBOT.."MARTEN:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(SoFi.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "⌯︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
end 
if not bot_data:get(XBOT..'MARTEN:Lock:Id'..msg.chat_id_) then
if not bot_data:get(XBOT..'MARTEN:Lock:Id:Photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, "⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '⌯︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, XxBOt)
end
end 
--     source -𝐗-     --
if ChatType =='sp' or ChatType =='gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "التعديل" then
if not bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التعديل\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "التعديل الميديا" or LockText[2] == "تعديل الميديا" then
if not bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل تعديل الميديا\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه" then
if not bot_data:get(XBOT..'MARTEN:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفارسيه\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Farsi'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفشار" then
if bot_data:get(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفشار\n•-› X")  
bot_data:del(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الطائفيه" then
if bot_data:get(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الطائفيه\n•-› X")  
bot_data:del(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكفر" then
if bot_data:get(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الكفر\n•-› X")  
bot_data:del(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه بالطرد" then
if not bot_data:get(XBOT..'MARTEN:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفارسيه بالطرد\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:FarsiBan'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if LockText[2] == "البوتات" or LockText[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل البوتات بالحذف\n•-› X")  
bot_data:set(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل البوتات بالطرد\n•-› X")  
bot_data:set(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "البوتات بالتقييد" or LockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل البوتات بالتقيد\n•-› X")  
bot_data:set(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "التكرار" or LockText[2] == "التكرار بالحذف" then 
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالحذف\n•-› X")  
end
if LockText[2] == "التكرار بالطرد" then 
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالطرد\n•-› X")  
end
if LockText[2] == "التكرار بالتقيد" or LockText[2] == "التكرار بالتقييد" then 
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالتقيد\n•-› X")  
end
if LockText[2] == "التكرار بالكتم" then 
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالكتم\n•-› X")  
end
if BasicConstructor(msg) then
if LockText[2] == "التثبيت" then
if not bot_data:get(XBOT..'MARTEN:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  bot_data:set(XBOT.."MARTEN:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التثبيت\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Pin'..msg.chat_id_,true)
bot_data:sadd(XBOT.."MARTEN:Lock:Pinpin",msg.chat_id_) 
else
send(msg.chat_id_, msg.id_, 1, '⌯︙التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     source -𝐗-     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     source -𝐗-     --
if Manager(msg) then
if text and text =='تفعيل الايدي بالصوره' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Id:Photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الايدي بـ الصوره\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text =='تعطيل الايدي بالصوره' and ChCheck(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Id:Photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الايدي بـ الصوره\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text =='تفعيل الايدي' and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Lock:Id'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالتاكيد مفعل ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الايدي بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:Id'..msg.chat_id_)
end end 
if text and text =='تعطيل الايدي' and ChCheck(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Id'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالتاكيد معطل ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الايدي بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:Id'..msg.chat_id_,true)
end end
end
--     source -𝐗-     --
if text =='ضع رابط' and ChCheck(msg) or text =='وضع رابط' and ChCheck(msg) or text =='ضع الرابط' and ChCheck(msg) or text =='وضع الرابط' and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
bot_data:setex(XBOT.."MARTEN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text =='انشاء رابط' and ChCheck(msg) or text =='انشاء الرابط' and ChCheck(msg) then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not bot_data:get(XBOT.."MARTEN:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
bot_data:set(XBOT.."MARTEN:Groups:Links"..msg.chat_id_,LinkGroup) 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⌯︙ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
bot_data:setex(XBOT.."MARTEN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     source -𝐗-     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الترحيب بنجاح\n•-› ✓")
bot_data:set(XBOT.."MARTEN:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الترحيب بنجاح\n•-› X")
bot_data:del(XBOT.."MARTEN:Lock:Welcome"..msg.chat_id_)
end
if bot_data:get(XBOT..'MARTEN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
bot_data:del(XBOT..'MARTEN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
bot_data:del(XBOT..'MARTEN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
bot_data:set(XBOT..'MARTEN:Groups:Welcomes'..msg.chat_id_,Welcomes)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) or text and text:match("^اضف ترحيب$") and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي الترحيب الان\n⌯︙تستطيع اضافة مايلي ↫ ⤈\n⌯︙دالة عرض الاسم ↫ firstname\n⌯︙دالة عرض المعرف ↫ username', 1, 'md')
bot_data:set(XBOT..'MARTEN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الترحيب")  
bot_data:del(XBOT..'MARTEN:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local Welcomes = bot_data:get(XBOT..'MARTEN:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
send(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⌯︙لم يتم وضع الترحيب \n⌯︙ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     source -𝐗-     --
if bot_data:get(XBOT..'MARTEN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء حفظ الوصف", 1, 'md')
bot_data:del(XBOT..'MARTEN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
bot_data:del(XBOT..'MARTEN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
bot_data:set(XBOT..'MARTEN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي الوصف الان', 1, 'md')
end
--     source -𝐗-     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي الكلمه الان", 1, 'md') 
bot_data:set(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if bot_data:get(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر المنع', 1, 'md')
bot_data:del(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم منع الكلمه ↫ "..text, 1, 'html')
bot_data:del(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
bot_data:hset(XBOT..'MARTEN:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي الكلمه الان", 1, 'md') 
bot_data:set(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if bot_data:get(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر الغاء المنع', 1, 'md')
bot_data:del(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not bot_data:hget(XBOT..'MARTEN:Filters:'..msg.chat_id_, text) then  
send(msg.chat_id_, msg.id_, 1, "⌯︙الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
bot_data:del(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
bot_data:hdel(XBOT..'MARTEN:Filters:'..msg.chat_id_, text)
send(msg.chat_id_, msg.id_, 1, "⌯︙الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
bot_data:del(XBOT.."MARTEN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     source -𝐗-     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫  الاحصائيات ⌯" and ChCheck(msg) then
local gps = bot_data:scard(XBOT.."MARTEN:Groups") local users = bot_data:scard(XBOT.."MARTEN:Users") 
send(msg.chat_id_, msg.id_, 1, '⌯︙احصائيات البوت ↫ ⤈\n⌯︙عدد المشتركين ↫ ❨ '..users..' ❩\n⌯︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين ⌯" and ChCheck(msg) then
local users = bot_data:scard(XBOT.."MARTEN:Users")
send(msg.chat_id_, msg.id_, 1, '⌯︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ⌯" and ChCheck(msg) then
local gps = bot_data:scard(XBOT.."MARTEN:Groups")
send(msg.chat_id_, msg.id_, 1, '⌯︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
end
--     source -𝐗-     --
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ⌯" and ChCheck(msg) then
if not SudoBot(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطورين فقط ', 1, 'md')
else
local list = bot_data:smembers(XBOT.."MARTEN:Groups")
local t ='⌯︙مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(list) do
t = t..k.."~ : `"..v.."`\n" 
end
if #list == 0 then
t ='⌯︙لا يوجد مجموعات مفعله'
end
send(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     source -𝐗-     --
if text and text:match('^تنظيف (%d+)$') or text and text:match('^مسح (%d+)$') and ChCheck(msg) then  
if not bot_data:get(XBOT..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$') or text:match('^مسح (%d+)$')) 
if Number > 5000 then 
send(msg.chat_id_, msg.id_, 1, '⌯︙لاتستطيع تنظيف اكثر من 5000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
bot_data:setex(XBOT..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المشتركين ⌯" and SecondSudo(msg) and ChCheck(msg) then 
local pv = bot_data:smembers(XBOT.."MARTEN:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
bot_data:srem(XBOT.."MARTEN:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_, 1, '⌯︙*لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_, 1, '⌯︙عدد المشتركين الان ↫ { '..#pv..' }\n⌯︙تم حذف ↫ { '..sendok..' } من المشتركين\n⌯︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     source -𝐗-     --
if text == "تنظيف الكروبات" and SecondSudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المجموعات ⌯" and SecondSudo(msg) and ChCheck(msg) then 
local group = bot_data:smembers(XBOT.."MARTEN:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
bot_data:srem(XBOT.."MARTEN:Groups",group[i]) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = group[i], user_id_ = XBOT, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
bot_data:srem(XBOT.."MARTEN:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
bot_data:srem(XBOT.."MARTEN:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
bot_data:srem(XBOT.."MARTEN:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_, 1,'⌯︙*لاتوجد مجموعات وهميه*', 1, 'md')   
else
local XBOTgp2 = (w + q)
local XBOTgp3 = #group - XBOTgp2
if q == 0 then
XBOTgp2 =''
else
XBOTgp2 ='\n⌯︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
XBOTgp1 =''
else
XBOTgp1 ='\n⌯︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
send(msg.chat_id_, msg.id_, 1,'⌯︙عدد الكروبات الان ↫ { '..#group..' }'..XBOTgp1..XBOTgp2..'\n⌯︙العدد الحقيقي الان  ↫ ( '..XBOTgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     source -𝐗-     --
if text and (text == "تفعيل التلقائي" or text == "تفعيل المسح التلقائي" or text == "تفعيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ميزة الحذف التلقائي للميديا\n•-› ✓")
bot_data:set(XBOT..'MARTEN:Lock:CleanNum'..msg.chat_id_,true)  
end
if text and (text == "تعطيل التلقائي" or text == "تعطيل المسح التلقائي" or text == "تعطيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الحذف التلقائي للميديا\n•-› X")
bot_data:del(XBOT..'MARTEN:Lock:CleanNum'..msg.chat_id_) 
end
if text and (text:match("^تعين عدد المسح (%d+)$") or text:match("^تعيين عدد المسح (%d+)$") or text:match("^تعين عدد الحذف (%d+)$") or text:match("^تعيين عدد الحذف (%d+)$") or text:match("^عدد المسح (%d+)$")) and Constructor(msg) and ChCheck(msg) then
local Num = text:match("تعين عدد المسح (%d+)$") or text:match("تعيين عدد المسح (%d+)$") or text:match("تعين عدد الحذف (%d+)$") or text:match("تعيين عدد الحذف (%d+)$") or text:match("عدد المسح (%d+)$")
if tonumber(Num) < 10 or tonumber(Num) > 2000 then
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بتحديد عدد اكبر من 10 واصغر من 2000 للحذف التلقائي', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع ↫ *'..Num..'* من الميديا للحذف التلقائي', 1, 'md')
bot_data:set(XBOT..'MARTEN:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and bot_data:get(XBOT..'MARTEN:Lock:CleanNum'..msg.chat_id_) then
if bot_data:get(XBOT..'MARTEN:CleanNum'..msg.chat_id_) then CleanNum = bot_data:get(XBOT..'MARTEN:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if bot_data:scard(XBOT.."MARTEN:cleanernum"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = bot_data:smembers(XBOT.."MARTEN:cleanernum"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"⌯︙تم حذف "..Del.." من الميديا تلقائيا",0,'md') 
bot_data:del(XBOT.."MARTEN:cleanernum"..msg.chat_id_)
end 
end
if CleanerNum(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:CleanNum'..msg.chat_id_) then 
if text == "التلقائي" and ChCheck(msg) or text == "عدد التلقائي" and ChCheck(msg) then 
local M = bot_data:scard(XBOT.."MARTEN:cleanernum"..msg.chat_id_)
if M ~= 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙عدد الميديا ↫ "..M.."\n⌯︙الحذف التلقائي ↫ "..(bot_data:get(XBOT..'MARTEN:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد ميديا هنا", 1, 'md') 
end end
end
end
--     source -𝐗-     --
if text == "تفعيل امسح" and Constructor(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امسح بنجاح\n•-› ✓")
bot_data:set(XBOT..'MARTEN:Lock:Clean'..msg.chat_id_,true)  
end
if text == "تعطيل امسح" and Constructor(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امسح بنجاح\n•-› X")
bot_data:del(XBOT..'MARTEN:Lock:Clean'..msg.chat_id_) 
end
if Cleaner(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and ChCheck(msg) or text == "عدد الميديا" and ChCheck(msg) then 
local M = bot_data:scard(XBOT.."MARTEN:cleaner"..msg.chat_id_)
if M ~= 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙عدد الميديا ↫ "..M, 1, 'md') 
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "احذف" and ChCheck(msg) or text == "تنظيف ميديا" and ChCheck(msg) or text == "تنظيف الميديا" and ChCheck(msg) then
local List = bot_data:smembers(XBOT.."MARTEN:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف "..Del.." من الميديا", 1, 'md') 
bot_data:del(XBOT.."MARTEN:cleaner"..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     source -𝐗-     --
if text == "تفعيل مسح الاغاني" and Constructor(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل مسح الاغاني بنجاح\n•-› ✓")
bot_data:set(XBOT..'MARTEN:Lock:CleanMusic'..msg.chat_id_,true)  
end
if text == "تعطيل مسح الاغاني" and Constructor(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل مسح الاغاني بنجاح\n•-› X")
bot_data:del(XBOT..'MARTEN:Lock:CleanMusic'..msg.chat_id_) 
end
if CleanerMusic(msg) then
if bot_data:get(XBOT..'MARTEN:Lock:CleanMusic'..msg.chat_id_) then 
if text == "الاغاني" and ChCheck(msg) or text == "عدد الاغاني" and ChCheck(msg) then 
local M = bot_data:scard(XBOT.."MARTEN:cleanermusic"..msg.chat_id_)
if M ~= 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙عدد الاغاني ↫ "..M, 1, 'md') 
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد اغاني هنا", 1, 'md') 
end end
if text == "مسح الاغاني" or text == "تنظيف الاغاني" or text == "حذف الاغاني" then
local List = bot_data:smembers(XBOT.."MARTEN:cleanermusic"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف "..Del.." من الاغاني", 1, 'md') 
bot_data:del(XBOT.."MARTEN:cleanermusic"..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد اغاني هنا", 1, 'md') 
end end end end
--     source -𝐗-     --
if Admin(msg) then
if text == "تنظيف تعديل" and ChCheck(msg) or text == "تنظيف التعديل" and ChCheck(msg) then   
MARTEN_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
MARTEN_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = MARTEN_Del},function(arg,data)
new = 0
MARTEN_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
MARTEN_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,MARTEN_Del2)
end,nil)  
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     source -𝐗-     --
if ChatType =='sp' or ChatType =='gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "التعديل" then
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التعديل\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if MARTENConstructor(msg) then
if UnLockText[2] == "التعديل الميديا" or UnLockText[2] == "تعديل الميديا" then
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح تعديل الميديا\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
if UnLockText[2] == "الفارسيه" then
if bot_data:get(XBOT..'MARTEN:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفارسيه\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Farsi'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفشار" then
if not bot_data:get(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفشار\n•-› ✓")  
bot_data:set(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الطائفيه" then
if not bot_data:get(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الطائفيه\n•-› ✓")  
bot_data:set(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكفر" then
if not bot_data:get(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الكفر\n•-› ✓")  
bot_data:set(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه بالطرد" then
if bot_data:get(XBOT..'MARTEN:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفارسيه بالطرد\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:FarsiBan'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if MARTENConstructor(msg) then
if UnLockText[2] == "البوتات" or UnLockText[2] == "البوتات بالطرد" or UnLockText[2] == "البوتات بالتقييد" or UnLockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح البوتات\n•-› ✓")  
bot_data:del(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_)  
end end
if UnLockText[2] == "التكرار" then 
bot_data:hdel(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التكرار\n•-› ✓")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "التثبيت" then
if bot_data:get(XBOT..'MARTEN:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التثبيت\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Pin'..msg.chat_id_)
bot_data:srem(XBOT.."MARTEN:Lock:Pinpin",msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     source -𝐗-     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not bot_data:get(XBOT..'MARTEN:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الدردشه\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Text'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not bot_data:get(XBOT..'MARTEN:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الاونلاين\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Inline'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not bot_data:get(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الصور\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not bot_data:get(XBOT..'MARTEN:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الكلايش\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Spam'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not bot_data:get(XBOT..'MARTEN:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الدخول\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Join'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not bot_data:get(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفيديو\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not bot_data:get(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل المتحركه\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not bot_data:get(XBOT..'MARTEN:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الاغاني\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Music'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not bot_data:get(XBOT..'MARTEN:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الصوت\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Voice'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الروابط\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Links'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not bot_data:get(XBOT..'MARTEN:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل المواقع\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Location'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل المعرفات\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not bot_data:get(XBOT..'MARTEN:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الملفات\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Document'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الهاشتاك\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not bot_data:get(XBOT..'MARTEN:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الجهات\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Contact'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '️⌯︙الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الشبكات\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_,true) 
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل العربيه\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الانكليزيه\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:English'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not bot_data:get(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الملصقات\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not bot_data:get(XBOT..'MARTEN:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الماركداون\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Markdown'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الاشعارات\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التوجيه\n•-› X")  
bot_data:set(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_,true)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     source -𝐗-     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if bot_data:get(XBOT..'MARTEN:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الدردشه\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Text'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if bot_data:get(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الصور\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if bot_data:get(XBOT..'MARTEN:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الكلايش\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Spam'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if bot_data:get(XBOT..'MARTEN:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الدخول\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Join'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if bot_data:get(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفيديو\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if bot_data:get(XBOT..'MARTEN:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الملفات\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Document'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if bot_data:get(XBOT..'MARTEN:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الاونلاين\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Inline'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if bot_data:get(XBOT..'MARTEN:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الماركداون\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Markdown'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if bot_data:get(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح المتحركه\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if bot_data:get(XBOT..'MARTEN:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الاغاني\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Music'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if bot_data:get(XBOT..'MARTEN:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الصوت\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Voice'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الروابط\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Links'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if bot_data:get(XBOT..'MARTEN:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح المواقع\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Location'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح المعرفات\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الهاشتاك\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if bot_data:get(XBOT..'MARTEN:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الجهات\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Contact'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الشبكات\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح العربيه\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الانكليزيه\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:English'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الاشعارات\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if bot_data:get(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الملصقات\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التوجيه\n•-› ✓")  
bot_data:del(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     source -𝐗-     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") and ChCheck(msg) then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئين فقط', 1, 'md')
else
bot_data:set(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_,"del") bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'MARTEN:Lock:Links','MARTEN:Lock:Contact','MARTEN:Lock:Forwards','MARTEN:Lock:Videos','MARTEN:Lock:Gifs','MARTEN:Lock:EditMsgs','MARTEN:Lock:Stickers','MARTEN:Lock:Farsi','MARTEN:Lock:Spam','MARTEN:Lock:WebLinks','MARTEN:Lock:Photo'}
for i,Lock in pairs(LockList) do
bot_data:set(XBOT..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التفليش\n•-› X")  
end
end
if text and text:match("^فتح التفليش$") and ChCheck(msg) then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئين فقط', 1, 'md')
else
bot_data:hdel(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'MARTEN:Lock:Links','MARTEN:Lock:Contact','MARTEN:Lock:Forwards','MARTEN:Lock:Videos','MARTEN:Lock:Gifs','MARTEN:Lock:EditMsgs','MARTEN:Lock:Stickers','MARTEN:Lock:Farsi','MARTEN:Lock:Spam','MARTEN:Lock:WebLinks','MARTEN:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
bot_data:del(XBOT..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التفليش\n•-› ✓")  
end
end
--     source -𝐗-     --
if text and text:match("^قفل الكل$") and ChCheck(msg) then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئين فقط', 1, 'md')
else
bot_data:del(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_) bot_data:del(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_) bot_data:del(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_) 
bot_data:set(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_,"del") bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'MARTEN:Lock:EditMsgs','MARTEN:Lock:Farsi','MARTEN:Lock:TagServr','MARTEN:Lock:Inline','MARTEN:Lock:Photo','MARTEN:Lock:Spam','MARTEN:Lock:Videos','MARTEN:Lock:Gifs','MARTEN:Lock:Music','MARTEN:Lock:Voice','MARTEN:Lock:Links','MARTEN:Lock:Location','MARTEN:Lock:Tags','MARTEN:Lock:Stickers','MARTEN:Lock:Markdown','MARTEN:Lock:Forwards','MARTEN:Lock:Document','MARTEN:Lock:Contact','MARTEN:Lock:Hashtak','MARTEN:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
bot_data:set(XBOT..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل جميع الاوامر\n•-› X")  
end
end
if text and text:match("^فتح الكل$") and ChCheck(msg) then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئين فقط', 1, 'md')
else
bot_data:set(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_,true) bot_data:set(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_,true) bot_data:set(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_,true) bot_data:hdel(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'MARTEN:Lock:EditMsgs','MARTEN:Lock:Text','MARTEN:Lock:Arabic','MARTEN:Lock:English','MARTEN:Lock:Join','MARTEN:Lock:Bots','MARTEN:Lock:Farsi','MARTEN:Lock:FarsiBan','MARTEN:Lock:TagServr','MARTEN:Lock:Inline','MARTEN:Lock:Photo','MARTEN:Lock:Spam','MARTEN:Lock:Videos','MARTEN:Lock:Gifs','MARTEN:Lock:Music','MARTEN:Lock:Voice','MARTEN:Lock:Links','MARTEN:Lock:Location','MARTEN:Lock:Tags','MARTEN:Lock:Stickers','MARTEN:Lock:Markdown','MARTEN:Lock:Forwards','MARTEN:Lock:Document','MARTEN:Lock:Contact','MARTEN:Lock:Hashtak','MARTEN:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
bot_data:del(XBOT..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح جميع الاوامر\n•-› ✓")  
end
end
--     source -𝐗-     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
send(msg.chat_id_, msg.id_, 1, '⌯︙اختر عدد اكبر من 40 حرف ', 1, 'md')
else
bot_data:set(XBOT..'MARTEN:Spam:Text'..msg.chat_id_,SetSpam)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     source -𝐗-     --
if Manager(msg) then
if text == "فحص" and ChCheck(msg) or text == "فحص البوت" and ChCheck(msg) then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..XBOT)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT ='✔️' else EDT ='✖️' end
if GetInfo.result.can_delete_messages == true then DEL ='✔️' else DEL ='✖️' end
if GetInfo.result.can_invite_users == true then INV ='✔️' else INV ='✖️' end
if GetInfo.result.can_pin_messages == true then PIN ='✔️' else PIN ='✖️' end
if GetInfo.result.can_restrict_members == true then BAN ='✔️' else BAN ='✖️' end
if GetInfo.result.can_promote_members == true then VIP ='✔️' else VIP ='✖️' end 
send(msg.chat_id_, msg.id_, 1, '⌯︙صلاحيات البوت هي ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙حذف الرسائل ↫ '..DEL..'\n⌯︙دعوة المستخدمين ↫ '..INV..'\n⌯︙حظر المستخدمين ↫ '..BAN..'\n⌯︙تثبيت الرسائل ↫ '..PIN..'\n⌯︙تغيير المعلومات ↫ '..EDT..'\n⌯︙اضافة مشرفين ↫ '..VIP..'\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المطور (.*)$") 
bot_data:set(XBOT.."MARTEN:SudoBot:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
bot_data:set(XBOT.."MARTEN:BasicConstructor:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المنشئ (.*)$") 
bot_data:set(XBOT.."MARTEN:Constructor:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المدير (.*)$") 
bot_data:set(XBOT.."MARTEN:Managers:Rd"..msg.chat_id_,Text) 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد الادمن (.*)$") 
bot_data:set(XBOT.."MARTEN:Admins:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المميز (.*)$") 
bot_data:set(XBOT.."MARTEN:VipMem:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المنظف (.*)$") 
bot_data:set(XBOT.."MARTEN:Cleaner:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد العضو (.*)$") 
bot_data:set(XBOT.."MARTEN:mem:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف جميع ردود الرتب", 1, 'md')
bot_data:del(XBOT.."MARTEN:mem:Rd"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:Cleaner:Rd"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:VipMem:Rd"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:Admins:Rd"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:Managers:Rd"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:Constructor:Rd"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:BasicConstructor:Rd"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:SudoBot:Rd"..msg.chat_id_)
end
end
--     source -𝐗-     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text ='⌯︙*قائمة البوتات* ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab =''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab =' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a ='ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙*عدد البوتات هنا* ↫ '..n..'\n'
local f ='⌯︙*عدد البوتات المرفوعه* ↫ '..t..'\n⌯︙*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
send(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text =='حذف البوتات' and ChCheck(msg) or text =='طرد البوتات' and ChCheck(msg) or text =='مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(XBOT) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙*لاتوجد بوتات هنا*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "⌯︙*عدد البوتات هنا* ↫ "..c.."\n⌯︙*عدد البوتات المرفوعه* ↫ "..x.."\n⌯︙*تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     source -𝐗-     --
end
--     source -𝐗-     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") or text and text:match("^مسح (.*)$") then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then
if txts[2] =='الاساسيين' or txtss[2] =='الاساسيين' or txts[2] =='المطورين الاساسيين' or txtss[2] =='المطورين الاساسيين' then
bot_data:del(XBOT..'MARTEN:MARTENSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المطورين الاساسيين")  
end
end
if MARTENSudo(msg) then
if txts[2] =='الثانويين' or txtss[2] =='الثانويين' or txts[2] =='المطورين الثانويين' or txtss[2] =='المطورين الثانويين' then
bot_data:del(XBOT..'MARTEN:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المطورين الثانويين")  
end
end
if SecondSudo(msg) then 
if txts[2] =='المطورين' or txtss[2] =='المطورين' then
bot_data:del(XBOT..'MARTEN:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المطورين")  
end
if txts[2] =='قائمه العام' or txtss[2] =='قائمه العام' then
bot_data:del(XBOT..'MARTEN:BanAll:')
bot_data:del(XBOT..'MARTEN:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] =='المالكين' or txtss[2] =='المالكين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الماالكين")  
bot_data:del(XBOT..'MARTEN:Owner:'..msg.chat_id_)
end
end
if SudoBot(msg) then
if txts[2] =='المالكين' or txtss[2] =='المالكين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الماالكين")  
bot_data:del(XBOT..'MARTEN:Owner:'..msg.chat_id_)
end
end
if Owner(msg) then
if txts[2] =='المنشئين الاساسيين' or txtss[2] =='المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المنشئين الاساسيين")  
bot_data:del(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] =='المنشئين' or txtss[2] =='المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المنشئين")  
bot_data:del(XBOT..'MARTEN:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] =='المدراء' or txtss[2] =='المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المدراء")  
bot_data:del(XBOT..'MARTEN:Managers:'..msg.chat_id_)
end 
if txts[2] =='المنظفين' or txtss[2] =='المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المنظفين")  
bot_data:del(XBOT..'MARTEN:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] =='الادمنيه' or txtss[2] =='الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الادمنيه")  
bot_data:del(XBOT..'MARTEN:Admins:'..msg.chat_id_)
end
end
if txts[2] =='قوانين' or txtss[2] =='قوانين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف القوانين")  
bot_data:del(XBOT..'MARTEN:rules'..msg.chat_id_)
end
if txts[2] =='المطايه' or txtss[2] =='المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المطايه")  
bot_data:del(XBOT..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الحاتات' or txtss[2] == 'الحاتات' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الحاتات")  
bot_data:del(XBOT..'User:HaTa:'..msg.chat_id_)
end
if txts[2] == 'الصاكين' or txtss[2] == 'الصاكين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الصاكين")  
bot_data:del(XBOT..'User:hlo:'..msg.chat_id_)
end
if txts[2] == 'الصخوله' or txtss[2] == 'الصخوله' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الصخوله")  
bot_data:del(XBOT..'User:Sakl:'..msg.chat_id_)
end
if txts[2] == 'الجلاب' or txtss[2] == 'الجلاب' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الجلاب")  
bot_data:del(XBOT..'User:Dog:'..msg.chat_id_)
end
if txts[2] == 'القورده' or txtss[2] == 'القورده' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف القورده")  
bot_data:del(XBOT..'User:Monkey:'..msg.chat_id_)
end
if txts[2] == 'الضلوع' or txtss[2] == 'الضلوع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الضلوع")  
bot_data:del(XBOT..'User:Bro:'..msg.chat_id_)
end
if txts[2] == 'الضلعات' or txtss[2] == 'الضلعات' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الضلعات")  
bot_data:del(XBOT..'User:Bro:Girl'..msg.chat_id_)
end
if txts[2] == 'البقرات' or txtss[2] == 'البقرات' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف البقرات")  
bot_data:del(XBOT..'User:Bakra:'..msg.chat_id_)
end
if txts[2] == 'الطليان' or txtss[2] == 'الطليان' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الطليان")  
bot_data:del(XBOT..'User:Tale:'..msg.chat_id_)
end
if txts[2] == 'الزواحف' or txtss[2] == 'الزواحف' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الزواحف")  
bot_data:del(XBOT..'User:Zahf:'..msg.chat_id_)
end
if txts[2] == 'الجريذيه' or txtss[2] == 'الجريذيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الجريذيه")  
bot_data:del(XBOT..'User:Jred:'..msg.chat_id_)
end
if txts[2] =='الرابط' or txtss[2] =='الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف رابط المجموعه")  
bot_data:del(XBOT.."MARTEN:Groups:Links"..msg.chat_id_)
end
if txts[2] =='المميزين' or txtss[2] =='المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المميزين")  
bot_data:del(XBOT..'MARTEN:VipMem:'..msg.chat_id_)
end
if txts[2] =='المكتومين' or txtss[2] =='المكتومين' then
bot_data:del(XBOT..'MARTEN:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المكتومين")  
end
if txts[2] =='المقيدين' or txtss[2] =='المقيدين' then     
local List = bot_data:smembers(XBOT..'MARTEN:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
bot_data:srem(XBOT..'MARTEN:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المقيدين")  
end
if txts[2] =='قوائم المنع' or txtss[2] =='قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قوائم المنع")  
bot_data:del(XBOT..'MARTEN:Filters:'..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:FilterAnimation"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:FilterPhoto"..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:FilterSteckr"..msg.chat_id_)
end
if txts[2] =='قائمه منع المتحركات' or txtss[2] =='قائمه منع المتحركات' then     
bot_data:del(XBOT.."MARTEN:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة منع المتحركات")  
end
if txts[2] =='قائمه منع الصور' or txtss[2] =='قائمه منع الصور' then     
bot_data:del(XBOT.."MARTEN:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة منع الصور")  
end
if txts[2] =='قائمه منع الملصقات' or txtss[2] =='قائمه منع الملصقات' then     
bot_data:del(XBOT.."MARTEN:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة منع الملصقات")  
end
end
end
--     source -𝐗-     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئ الاساسي فقط', 1, 'md')
else
local Ban = bot_data:smembers(XBOT..'MARTEN:Ban:'..msg.chat_id_)
local Muted = bot_data:smembers(XBOT..'MARTEN:Muted:'..msg.chat_id_)
local Tkeed = bot_data:smembers(XBOT..'MARTEN:Tkeed:'..msg.chat_id_)
local Filters = bot_data:smembers(XBOT..'MARTEN:Filters:'..msg.chat_id_)
local donky = bot_data:smembers(XBOT..'User:Donky:'..msg.chat_id_)
local HaTa = bot_data:smembers(XBOT..'User:HaTa:'..msg.chat_id_)
local hlo = bot_data:smembers(XBOT..'User:hlo:'..msg.chat_id_)
local Sakl = bot_data:smembers(XBOT..'User:Sakl:'..msg.chat_id_)
local Dog = bot_data:smembers(XBOT..'User:Dog:'..msg.chat_id_)
local Monkey = bot_data:smembers(XBOT..'User:Monkey:'..msg.chat_id_)
local Bakra = bot_data:smembers(XBOT..'User:Bakra:'..msg.chat_id_)
local Tale = bot_data:smembers(XBOT..'User:Tale:'..msg.chat_id_)
local Zahf = bot_data:smembers(XBOT..'User:Zahf:'..msg.chat_id_)
local Jred = bot_data:smembers(XBOT..'User:Jred:'..msg.chat_id_)
local Bro = bot_data:smembers(XBOT..'User:Bro:'..msg.chat_id_)
local Girl = bot_data:smembers(XBOT..'User:Bro:Girl'..msg.chat_id_)
if #Ban ~= 0 then Bant = 'المحظورين • ' else Bant = '' end
if #Muted ~= 0 then Mutedt = 'المكتومين • ' else Mutedt = '' end
if #Tkeed ~= 0 then Tkeedt = 'المقيدين • ' else Tkeedt = '' end
if #Filters ~= 0 then Filterst = 'قائمة المنع • ' else Filterst = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #HaTa ~= 0 then HaTat = 'الحاتات • ' else HaTat = '' end
if #hlo ~= 0 then hlot = 'الصاكين • ' else hlot = '' end
if #Sakl ~= 0 then Saklt = 'الصخوله • ' else Saklt = '' end
if #Dog ~= 0 then Dogt = 'الجلاب • ' else Dogt = '' end
if #Monkey ~= 0 then Monkeyt = 'القورده • ' else Monkeyt = '' end
if #Bakra ~= 0 then Bakrat = 'البقرات • ' else Bakrat = '' end
if #Tale ~= 0 then Talet = 'الطليان • ' else Talet = '' end
if #Zahf ~= 0 then Zahft = 'الزواحف • ' else Zahft = '' end
if #Jred ~= 0 then Jredt = 'الجريذيه • ' else Jredt = '' end
if #Bro ~= 0 then Brot = 'الضلوع • ' else Brot = '' end
if #Girl ~= 0 then Girlt = 'الضلعات • ' else Girlt = '' end
if #Ban ~= 0 or #Muted ~= 0 or #Tkeed ~= 0 or #Filters ~= 0 or #donky ~= 0 or #HaTa ~= 0 or #hlo ~= 0 or #Sakl ~= 0 or #Dog ~= 0 or #Monkey ~= 0 or #Bakra ~= 0 or #Tale ~= 0 or #Zahf ~= 0 or #Jred ~= 0 or #Bro ~= 0 or #Girl ~= 0 then 
bot_data:del(XBOT..'MARTEN:Ban:'..msg.chat_id_) 
bot_data:del(XBOT..'MARTEN:Filters:'..msg.chat_id_) 
bot_data:del(XBOT..'MARTEN:Muted:'..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Tkeed:'..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Cleaner:'..msg.chat_id_)
bot_data:del(XBOT..'User:Donky:'..msg.chat_id_)
bot_data:del(XBOT..'User:HaTa:'..msg.chat_id_)
bot_data:del(XBOT..'User:hlo:'..msg.chat_id_)
bot_data:del(XBOT..'User:Sakl:'..msg.chat_id_)
bot_data:del(XBOT..'User:Dog:'..msg.chat_id_)
bot_data:del(XBOT..'User:Monkey:'..msg.chat_id_)
bot_data:del(XBOT..'User:Bakra:'..msg.chat_id_)
bot_data:del(XBOT..'User:Tale:'..msg.chat_id_)
bot_data:del(XBOT..'User:Zahf:'..msg.chat_id_)
bot_data:del(XBOT..'User:Jred:'..msg.chat_id_)
bot_data:del(XBOT..'User:Bro:'..msg.chat_id_)
bot_data:del(XBOT..'User:Bro:Girl'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف جميع القوائم التاليه ↫ ❨ "..Bant..''..Mutedt..''..Tkeedt..''..Filterst..''..donkyt..''..HaTat..''..hlot..''..Saklt..''..Dogt..''..Monkeyt..''..Bakrat..''..Talet..''..Zahft..''..Jredt..''..Brot..''..Girlt.." ❩ بنجاح \n ✓", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد قوائم هنا", 1, 'md')
end 
end
end
--     source -𝐗-     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمنشئ المجموعه فقط', 1, 'md')
else
local basicconstructor = bot_data:smembers(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_)
local constructor = bot_data:smembers(XBOT..'MARTEN:Constructor:'..msg.chat_id_)
local Managers = bot_data:smembers(XBOT..'MARTEN:Managers:'..msg.chat_id_)
local admins = bot_data:smembers(XBOT..'MARTEN:Admins:'..msg.chat_id_)
local vipmem = bot_data:smembers(XBOT..'MARTEN:VipMem:'..msg.chat_id_)
local cleaner = bot_data:smembers(XBOT..'MARTEN:Cleaner:'..msg.chat_id_)
local donky = bot_data:smembers(XBOT..'User:Donky:'..msg.chat_id_)
local HaTa = bot_data:smembers(XBOT..'User:HaTa:'..msg.chat_id_)
local hlo = bot_data:smembers(XBOT..'User:hlo:'..msg.chat_id_)
local Sakl = bot_data:smembers(XBOT..'User:Sakl:'..msg.chat_id_)
local Dog = bot_data:smembers(XBOT..'User:Dog:'..msg.chat_id_)
local Monkey = bot_data:smembers(XBOT..'User:Monkey:'..msg.chat_id_)
local Bakra = bot_data:smembers(XBOT..'User:Bakra:'..msg.chat_id_)
local Tale = bot_data:smembers(XBOT..'User:Tale:'..msg.chat_id_)
local Zahf = bot_data:smembers(XBOT..'User:Zahf:'..msg.chat_id_)
local Jred = bot_data:smembers(XBOT..'User:Jred:'..msg.chat_id_)
local Bro = bot_data:smembers(XBOT..'User:Bro:'..msg.chat_id_)
local Girl = bot_data:smembers(XBOT..'User:Bro:Girl'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #cleaner ~= 0 then cleanert = 'المنظفين • ' else cleanert = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #HaTa ~= 0 then HaTat = 'الحاتات • ' else HaTat = '' end
if #hlo ~= 0 then hlot = 'الصاكين • ' else hlot = '' end
if #Sakl ~= 0 then Saklt = 'الصخوله • ' else Saklt = '' end
if #Dog ~= 0 then Dogt = 'الجلاب • ' else Dogt = '' end
if #Monkey ~= 0 then Monkeyt = 'القورده • ' else Monkeyt = '' end
if #Bakra ~= 0 then Bakrat = 'البقرات • ' else Bakrat = '' end
if #Tale ~= 0 then Talet = 'الطليان • ' else Talet = '' end
if #Zahf ~= 0 then Zahft = 'الزواحف • ' else Zahft = '' end
if #Jred ~= 0 then Jredt = 'الجريذيه • ' else Jredt = '' end
if #Bro ~= 0 then Brot = 'الضلوع • ' else Brot = '' end
if #Girl ~= 0 then Girlt = 'الضلعات • ' else Girlt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #cleaner ~= 0 or #donky ~= 0 or #HaTa ~= 0 or #hlo ~= 0 or #Sakl ~= 0 or #Dog ~= 0 or #Monkey ~= 0 or #Bakra ~= 0 or #Tale ~= 0 or #Zahf ~= 0 or #Jred ~= 0 or #Bro ~= 0 or #Girl ~= 0 then 
bot_data:del(XBOT..'MARTEN:BasicConstructor:'..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Constructor:'..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Managers:'..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Admins:'..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:VipMem:'..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Cleaner:'..msg.chat_id_)
bot_data:del(XBOT..'User:Donky:'..msg.chat_id_)
bot_data:del(XBOT..'User:HaTa:'..msg.chat_id_)
bot_data:del(XBOT..'User:hlo:'..msg.chat_id_)
bot_data:del(XBOT..'User:Sakl:'..msg.chat_id_)
bot_data:del(XBOT..'User:Dog:'..msg.chat_id_)
bot_data:del(XBOT..'User:Monkey:'..msg.chat_id_)
bot_data:del(XBOT..'User:Bakra:'..msg.chat_id_)
bot_data:del(XBOT..'User:Tale:'..msg.chat_id_)
bot_data:del(XBOT..'User:Zahf:'..msg.chat_id_)
bot_data:del(XBOT..'User:Jred:'..msg.chat_id_)
bot_data:del(XBOT..'User:Bro:'..msg.chat_id_)
bot_data:del(XBOT..'User:Bro:Girl'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..''..constructort..''..Managerst..''..adminst..''..vipmemt..''..cleanert..''..donkyt..''..HaTat..''..hlot..''..Saklt..''..Dogt..''..Monkeyt..''..Bakrat..''..Talet..''..Zahft..''..Jredt..''..Brot..''..Girlt.." ❩ بنجاح \n ✓", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     source -𝐗-     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not bot_data:get(XBOT..'MARTEN:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = bot_data:get(XBOT..'MARTEN:Spam:Text'..msg.chat_id_)
end
--     source -𝐗-     --
if bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     source -𝐗-     --
if bot_data:get(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif bot_data:get(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif bot_data:get(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     source -𝐗-     --
if bot_data:get(XBOT..'MARTEN:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if bot_data:get(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if bot_data:get(XBOT.."MARTEN:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if bot_data:get(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if bot_data:get(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if bot_data:get(XBOT..'MARTEN:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
if bot_data:get(XBOT..'MARTEN:MARTEN:Lock:Xn'..msg.chat_id_) then lock_xn = 'مفتوحه' else lock_xn = 'مقفله' end
if bot_data:get(XBOT..'MARTEN:Lock:CleanNum'..msg.chat_id_) then lock_CleanNum = 'مفعله' else lock_CleanNum = 'معطله' end
if bot_data:get(XBOT..'MARTEN:Lock:Clean'..msg.chat_id_) then lock_Clean = 'مفعله' else lock_Clean = 'معطله' end
local Flood_Num = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
local Flood_Num_Time = bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local Clean_Num = bot_data:get(XBOT.."MARTEN:CleanNum"..msg.chat_id_,Num) or 200
--     source -𝐗-     --
--     source -𝐗-     --
local TXTE = "⌯︙اعدادات المجموعه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
.."⌯︙الروابط ↫ "..mute_links.."\n"
.."⌯︙المعرف ↫ "..lock_tag.."\n"
.."⌯︙البوتات ↫ "..lock_bots.."\n"
.."⌯︙المتحركه ↫ "..mute_gifs.."\n"
.."⌯︙الملصقات ↫ "..lock_sticker.."\n"
.."⌯︙الملفات ↫ "..lock_file.."\n"
.."⌯︙الصور ↫ "..mute_photo.."\n"
.."⌯︙الفيديو ↫ "..mute_video.."\n"
.."⌯︙الاونلاين ↫ "..mute_in.."\n"
.."⌯︙الدردشه ↫ "..mute_text.."\n"
.."⌯︙التوجيه ↫ "..lock_forward.."\n"
.."⌯︙الاغاني ↫ "..mute_music.."\n"
.."⌯︙الصوت ↫ "..mute_voice.."\n"
.."⌯︙الجهات ↫ "..lock_contact.."\n"
.."⌯︙الماركداون ↫ "..markdown.."\n"
.."⌯︙الهاشتاك ↫ "..lock_htag.."\n"
.."⌯︙التعديل ↫ "..mute_edit.."\n"
.."⌯︙التثبيت ↫ "..lock_pin.."\n"
.."⌯︙الاشعارات ↫ "..lock_tgservice.."\n"
.."⌯︙الكلايش ↫ "..lock_spam.."\n"
.."⌯︙الدخول ↫ "..lock_Join.."\n"
.."⌯︙الشبكات ↫ "..lock_wp.."\n"
.."⌯︙المواقع ↫ "..lock_location.."\n"
.."⌯︙الفشار ↫ "..lock_fshar.."\n"
.."⌯︙الاباحي ↫ "..lock_xn.."\n"
.."⌯︙الكفر ↫ "..lock_kaf.."\n"
.."⌯︙الطائفيه ↫ "..lock_taf.."\n"
.."⌯︙العربيه ↫ "..lock_arabic.."\n"
.."⌯︙الانكليزيه ↫ "..lock_english.."\n"
.."⌯︙الفارسيه ↫ "..lock_farsi.."\n"
.."⌯︙امسح ↫ "..lock_Clean.."\n"
.."⌯︙المسح التلقائي ↫ "..lock_CleanNum.."\n"
.."⌯︙عدد المسح التلقائي ↫ "..Clean_Num.."\n"
.."⌯︙التكرار ↫ "..flood.."\n"
.."⌯︙عدد التكرار ↫ "..Flood_Num.."\n"
.."⌯︙زمن التكرار ↫ "..Flood_Num_Time.."\n"
.."⌯︙عدد السبام ↫ "..spam_c.."\n"
.."ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
send(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     source -𝐗-     --
if text == "تفعيل كول" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر كول بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:spech:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل كول" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر كول بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:spech:MARTEN'..msg.chat_id_,true)  
end
if text and text:match("^كول (.*)$") and not bot_data:get(XBOT..'MARTEN:spech:MARTEN'..msg.chat_id_) then
local txt = {string.match(text, "^(كول) (.*)$")}
send(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if text == "تفعيل انطق" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ميزة انطق\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Antk:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل انطق" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ميزة انطق\n•-› ✓")
bot_data:set(XBOT..'MARTEN:Antk:MARTEN'..msg.chat_id_,true)  
end
if text and text:match("^انطق (.*)$") and not bot_data:get(XBOT..'MARTEN:Antk:MARTEN'..msg.chat_id_) and ChCheck(msg) then
local UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(text:match("^انطق (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     source -𝐗-     --
if bot_data:get(XBOT..'MARTEN:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ قوانين المجموعه', 1, 'md')
bot_data:del(XBOT..'MARTEN:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
bot_data:del(XBOT..'MARTEN:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:rules'..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي القوانين الان', 1, 'md')
bot_data:set(XBOT..'MARTEN:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") and ChCheck(msg) then
local rules = bot_data:get(XBOT..'MARTEN:rules'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     source -𝐗-     --
if text =='رقمي' and ChCheck(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "⌯︙رقمك ↫ +"..result.phone_number_
else
MyNumber = "⌯︙رقمك موضوع لجهات اتصالك فقط"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     source -𝐗-     --
if text == "تفعيل الزخرفه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الزخرفه بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Zrf:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الزخرفه بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Zrf:MARTEN'..msg.chat_id_,true)  
end
if bot_data:get(XBOT..'Zrf:MARTEN'..msg.chat_id_..msg.sender_user_id_) then 
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر الزخرفه', 1, 'md')
bot_data:del(XBOT..'Zrf:MARTEN'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌯︙قائمة الزخرفه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, 1, t, 1, 'md')
bot_data:del(XBOT..'Zrf:MARTEN'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not bot_data:get(XBOT..'MARTEN:Zrf:MARTEN'..msg.chat_id_) then
if text =='زخرفه' and ChCheck(msg) or text =='الزخرفه' and ChCheck(msg) then  
bot_data:setex(XBOT.."Zrf:MARTEN"..msg.chat_id_..msg.sender_user_id_,300,true)
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not bot_data:get(XBOT..'MARTEN:Zrf:MARTEN'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and ChCheck(msg) or text and text:match("^زخرف (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌯︙قائمة الزخرفه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     source -𝐗-     --
if text == "تفعيل الابراج" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الابراج بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Brg:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الابراج بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Brg:MARTEN'..msg.chat_id_,true)  
end
if not bot_data:get(XBOT..'MARTEN:Brg:MARTEN'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and ChCheck(msg) or text and text:match("^برجي (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs:gsub( "⌁", "⌯" ):gsub( "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉", "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ" )
send(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     source -𝐗-     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل اوامر النسب بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل اوامر النسب بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_,true)  
end
if not bot_data:get(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) then
if text == "نسبه الحب" and ChCheck(msg) or text == "نسبة الحب" and ChCheck(msg) then
bot_data:set(XBOT..'LoveNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and bot_data:get(XBOT..'LoveNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) then
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الحب ', 1, 'md')
bot_data:del(XBOT..'LoveNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
MARTEN = math.random(0,100);
send(msg.chat_id_, msg.id_, 1, '⌯︙نسبة الحب بين '..text..' هي : '..MARTEN..'%', 1, 'md')
bot_data:del(XBOT..'LoveNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not bot_data:get(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) then
if text == "نسبه الخيانه" and ChCheck(msg) or text == "نسبة الخيانه" and ChCheck(msg) or text == "↫ نسبه الخيانه ⌯" and ChCheck(msg) then
bot_data:set(XBOT..'RyNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسمين لحساب نسبة الخيانه بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الخيانه" and text ~= "نسبة الخيانه" and text ~= "↫ نسبه الخيانه ⌯" and bot_data:get(XBOT..'RyNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) then
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الخيانه ', 1, 'md')
bot_data:del(XBOT..'RyNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
MARTEN = math.random(0,100);
send(msg.chat_id_, msg.id_, 1, '⌯︙نسبة الخيانه بين '..text..' هي : '..MARTEN..'%', 1, 'md')
bot_data:del(XBOT..'RyNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not bot_data:get(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) then
if text and (text == "نسبه الجمال" or text == "نسبة الجمال" or text == "↫ نسبه الجمال ⌯") and ChCheck(msg) then
bot_data:set(XBOT..'JNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسم الشخص لقياس نسبة جماله كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الجمال" and text ~= "نسبة الجمال" and text ~= "↫ نسبه الجمال ⌯" and bot_data:get(XBOT..'JNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) then
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الجمال ', 1, 'md')
bot_data:del(XBOT..'JNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
MARTEN = math.random(0,100);
send(msg.chat_id_, msg.id_, 1, '⌯︙نسبة جمال '..text..' هي : '..MARTEN..'%', 1, 'md')
bot_data:del(XBOT..'JNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not bot_data:get(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) then
if text == "نسبه الكره" and ChCheck(msg) or text == "نسبة الكره" and ChCheck(msg) or text == "↫ نسبه الكره ⌯" and ChCheck(msg) then
bot_data:set(XBOT..'HataNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and text ~= "↫ نسبه الكره ⌯" and bot_data:get(XBOT..'HataNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) then
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الكره ', 1, 'md')
bot_data:del(XBOT..'HataNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
MARTEN = math.random(0,100);
send(msg.chat_id_, msg.id_, 1, '⌯︙نسبة الكره بين '..text..' هي : '..MARTEN..'%', 1, 'md')
bot_data:del(XBOT..'HataNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not bot_data:get(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله" or text == "↫ نسبه الرجوله ⌯") and ChCheck(msg) then
bot_data:set(XBOT..'RjolaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and text ~= "↫ نسبه الرجوله ⌯" and bot_data:get(XBOT..'RjolaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) then
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الرجوله ', 1, 'md')
bot_data:del(XBOT..'RjolaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
MARTEN = math.random(0,100);
send(msg.chat_id_, msg.id_, 1, '⌯︙نسبة رجولة '..text..' هي : '..MARTEN..'%', 1, 'md')
bot_data:del(XBOT..'RjolaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not bot_data:get(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه" or text == "↫ نسبه الانوثه ⌯") and ChCheck(msg) then
bot_data:set(XBOT..'AnothaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and text ~= "↫ نسبه الانوثه ⌯" and bot_data:get(XBOT..'AnothaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) then
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الانوثه ', 1, 'md')
bot_data:del(XBOT..'AnothaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
MARTEN = math.random(0,100);
send(msg.chat_id_, msg.id_, 1, '⌯︙نسبة انوثة '..text..' هي : '..MARTEN..'%', 1, 'md')
bot_data:del(XBOT..'AnothaNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not bot_data:get(XBOT..'MARTEN:Nsba:MARTEN'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء" or text == "↫ نسبه الغباء ⌯") and ChCheck(msg) then
bot_data:set(XBOT..'StupidNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and text ~= "↫ نسبه الغباء ⌯" and bot_data:get(XBOT..'StupidNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) then
if text and text =='الغاء' then 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الغباء ', 1, 'md')
bot_data:del(XBOT..'StupidNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
MARTEN = math.random(0,100);
send(msg.chat_id_, msg.id_, 1, '⌯︙نسبة غباء '..text..' هي : '..MARTEN..'%', 1, 'md')
bot_data:del(XBOT..'StupidNsba:MARTEN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     source -𝐗-     --
if text == "تفعيل حساب العمر" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل حساب العمر بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Age:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل حساب العمر بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Age:MARTEN'..msg.chat_id_,true)  
end
if not bot_data:get(XBOT..'MARTEN:Age:MARTEN'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and ChCheck(msg) or text and text:match("^عمري (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
send(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     source -𝐗-     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل معاني الاسماء\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Mean:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل التحقق بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Mean:MARTEN'..msg.chat_id_,true)  
end
if not bot_data:get(XBOT..'MARTEN:Mean:MARTEN'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and ChCheck(msg) or text and text:match("^معنى اسم (.*)$") and ChCheck(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs:gsub( "⌁", "⌯" ):gsub( "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉", "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ" )
send(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     source -𝐗-     --
if text == "تفعيل متحركه" and Manager(msg) and ChCheck(msg) or text == "تفعيل المتحركه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر المتحركه\n•-› ✓")
bot_data:del(XBOT..'MARTEN:gif:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل متحركه" and Manager(msg) and ChCheck(msg) or text == "تعطيل المتحركه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر المتحركه\n•-› X")
bot_data:set(XBOT..'MARTEN:gif:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "متحركه" or text == "↫ متحركه ⌯") and not bot_data:get(XBOT..'MARTEN:gif:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(4,143); 
local Text ='*⌯︙تم اختيار المتحركه لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/gif:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/AnimationXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل ميمز" and Manager(msg) and ChCheck(msg) or text == "تفعيل الميمز" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر الميمز\n•-› ✓")
bot_data:del(XBOT..'MARTEN:memz:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل ميمز" and Manager(msg) and ChCheck(msg) or text == "تعطيل الميمز" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر الميمز\n•-› X")
bot_data:set(XBOT..'MARTEN:memz:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "ميمز" or text == "↫ ميمز ⌯") and not bot_data:get(XBOT..'MARTEN:memz:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(3,1171); 
local Text ='*⌯︙تم اختيار مقطع الميمز لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/memz:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/MemzXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل غنيلي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الاغاني")
bot_data:del(XBOT..'MARTEN:Audios:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل غنيلي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الاغاني\n•-› X")
bot_data:set(XBOT..'MARTEN:Audios:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "غنيلي" or text == "↫ غنيلي ⌯") and not bot_data:get(XBOT..'MARTEN:Audios:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(3,2689); 
local Text ='*⌯︙تم اختيار المقطع الصوتي لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/Song:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/AudioXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل الاغاني" and Manager(msg) and ChCheck(msg) or text == "تفعيل اغنيه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر غنيلي بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:mp3:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل الاغاني" and Manager(msg) and ChCheck(msg) or text == "تعطيل اغنيه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر غنيلي بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:mp3:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "اغنيه" or text == "↫ اغنيه ⌯" or text == "اغاني") and not bot_data:get(XBOT..'MARTEN:mp3:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(2,1167); 
local Text ='*⌯︙تم اختيار الاغنيه لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/mp3:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendAudio?chat_id=' .. msg.chat_id_ .. '&audio=https://t.me/XBOTMp3/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل ريمكس" and Manager(msg) and ChCheck(msg) or text == "تفعيل الريمكس" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الريمكس بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Remix:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل ريمكس" and Manager(msg) and ChCheck(msg) or text == "تعطيل الريمكس" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الريمكس بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Remix:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "ريمكس" or text == "↫ ريمكس ⌯") and not bot_data:get(XBOT..'MARTEN:Remix:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(3,442); 
local Text ='*⌯︙تم اختيار الريمكس لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/remix:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/RemixXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل صوره" and Manager(msg) and ChCheck(msg) or text == "تفعيل الصوره" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الصوره بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Photo:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل صوره" and Manager(msg) and ChCheck(msg) or text == "تعطيل الصوره" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الصوره بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Photo:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "صوره" or text == "↫ صوره ⌯") and not bot_data:get(XBOT..'MARTEN:Photo:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(3,1146); 
local Text ='*⌯︙تم اختيار الصوره لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/photo:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/PhotosXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل انمي" and Manager(msg) and ChCheck(msg) or text == "تفعيل الانمي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الانمي بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Anime:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل انمي" and Manager(msg) and ChCheck(msg) or text == "تعطيل الانمي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الانمي بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Anime:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "انمي" or text == "↫ انمي ⌯") and not bot_data:get(XBOT..'MARTEN:Anime:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(3,1002); 
local Text ='*⌯︙تم اختيار صورة الانمي لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/anime:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/AnimesXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل فلم" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الافلام بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Movies:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل فلم" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الافلام بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Movies:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "فلم" or text == "↫ فلم ⌯") and not bot_data:get(XBOT..'MARTEN:Movies:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(45,125); 
local Text ='*⌯︙تم اختيار الفلم لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/Movies:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/MoviesXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if text == "تفعيل مسلسل" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل المسلسلات بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Series:MARTEN'..msg.chat_id_) 
end
if text == "تعطيل مسلسل" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل المسلسلات بنجاح")
bot_data:set(XBOT..'MARTEN:Series:MARTEN'..msg.chat_id_,true)  
end
if text and (text == "مسلسل" or text == "↫ مسلسل ⌯") and not bot_data:get(XBOT..'MARTEN:Series:MARTEN'..msg.chat_id_) and ChCheck(msg) then
MARTEN = math.random(2,54); 
local Text ='*⌯︙تم اختيار المسلسل لك*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="• مره اخرى •",callback_data="/series:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/SeriesXBOT/'..MARTEN..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     source -𝐗-     --
if Admin(msg) then
if bot_data:get(XBOT..'MARTEN:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if bot_data:get(XBOT..'MARTEN:Lock:Links'..msg.chat_id_) then mute_links ='مقفله' else mute_links ='مفتوحه' end local XxBOt = "\n" .."⌯︙الروابط ↫ "..mute_links.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if bot_data:get(XBOT..'MARTEN:Lock:Tags'..msg.chat_id_) then lock_tag ='مقفوله' else lock_tag ='مفتوحه' end local XxBOt = "\n" .."⌯︙المعرف ↫ "..lock_tag.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if bot_data:get(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_) then mute_gifs ='مقفوله' else mute_gifs ='مفتوحه' end local XxBOt = "\n" .."⌯︙المتحركه ↫ "..mute_gifs.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الملصقات" then if bot_data:get(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_) then lock_sticker ='مقفوله' else lock_sticker ='مفتوحه' end local XxBOt = "\n" .."⌯︙الملصقات ↫ "..lock_sticker.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الصور" then if bot_data:get(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_) then mute_photo ='مقفوله' else mute_photo ='مفتوحه' end local XxBOt = "\n" .."⌯︙الصور ↫ "..mute_photo.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if bot_data:get(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_) then mute_video ='مقفوله' else mute_video ='مفتوحه' end local XxBOt = "\n" .."⌯︙الفيديو ↫ "..mute_video.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الاونلاين" then if bot_data:get(XBOT..'MARTEN:Lock:Inline'..msg.chat_id_) then mute_in ='مقفل' else mute_in ='مفتوح' end local XxBOt = "\n" .."⌯︙الاونلاين ↫ "..mute_in.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الدردشه" then if bot_data:get(XBOT..'MARTEN:Lock:Text'..msg.chat_id_) then mute_text ='مقفله' else mute_text ='مفتوحه' end local XxBOt = "\n" .."⌯︙الدردشه ↫ "..mute_text.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then lock_forward ='مقفل' else lock_forward ='مفتوح' end local XxBOt = "\n" .."⌯︙التوجيه ↫ "..lock_forward.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الاغاني" then if bot_data:get(XBOT..'MARTEN:Lock:Music'..msg.chat_id_) then mute_music ='مقفوله' else mute_music ='مفتوحه' end local XxBOt = "\n" .."⌯︙الاغاني ↫ "..mute_music.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if bot_data:get(XBOT..'MARTEN:Lock:Voice'..msg.chat_id_) then mute_voice ='مقفول' else mute_voice ='مفتوح' end local XxBOt = "\n" .."⌯︙الصوت ↫ "..mute_voice.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if bot_data:get(XBOT..'MARTEN:Lock:Contact'..msg.chat_id_) then lock_contact ='مقفوله' else lock_contact ='مفتوحه' end local XxBOt = "\n" .."⌯︙الجهات ↫ "..lock_contact.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الماركداون" then if bot_data:get(XBOT..'MARTEN:Lock:Markdown'..msg.chat_id_) then markdown ='مقفل' else markdown ='مفتوح' end local XxBOt = "\n" .."⌯︙الماركداون ↫ "..markdown.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الهاشتاك" then if bot_data:get(XBOT..'MARTEN:Lock:Hashtak'..msg.chat_id_) then lock_htag ='مقفل' else lock_htag ='مفتوح' end local XxBOt = "\n" .."⌯︙الهاشتاك ↫ "..lock_htag.."\n"send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "التعديل" then if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then mute_edit ='مقفل' else mute_edit ='مفتوح' end local XxBOt = "\n" .."⌯︙التعديل ↫ "..mute_edit.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "التثبيت" then if bot_data:get(XBOT..'MARTEN:Lock:Pin'..msg.chat_id_) then lock_pin ='مقفل' else lock_pin ='مفتوح' end local XxBOt = "\n" .."⌯︙التثبيت ↫ "..lock_pin.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الاشعارات" then if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then lock_tgservice ='مقفوله' else lock_tgservice ='مفتوحه' end local XxBOt = "\n" .."⌯︙الاشعارات ↫ "..lock_tgservice.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الكلايش" then if bot_data:get(XBOT..'MARTEN:Lock:Spam'..msg.chat_id_) then lock_spam ='مقفوله' else lock_spam ='مفتوحه' end local XxBOt = "\n" .."⌯︙الكلايش ↫ "..lock_spam.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الدخول" then if bot_data:get(XBOT..'MARTEN:Lock:Join'..msg.chat_id_) then lock_Join ='مقفول' else lock_Join ='مفتوح' end local XxBOt = "\n" .."⌯︙الدخول ↫ "..lock_Join.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الشبكات" then if bot_data:get(XBOT..'MARTEN:Lock:WebLinks'..msg.chat_id_) then lock_wp ='مقفوله' else lock_wp ='مفتوحه' end local XxBOt = "\n" .."⌯︙الشبكات ↫ "..lock_wp.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "المواقع" then if bot_data:get(XBOT..'MARTEN:Lock:Location'..msg.chat_id_) then lock_location ='مقفوله' else lock_location ='مفتوحه' end local XxBOt = "\n" .."⌯︙المواقع ↫ "..lock_location.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "العربيه" then if bot_data:get(XBOT..'MARTEN:Lock:Arabic'..msg.chat_id_) then lock_arabic ='مقفوله' else lock_arabic ='مفتوحه' end local XxBOt = "\n" .."⌯︙العربيه ↫ "..lock_arabic.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الانكليزيه" then if bot_data:get(XBOT..'MARTEN:Lock:English'..msg.chat_id_) then lock_english ='مقفوله' else lock_english ='مفتوحه' end local XxBOt = "\n" .."⌯︙الانكليزيه ↫ "..lock_english.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الكفر" then if bot_data:get(XBOT..'MARTEN:Lock:Kfr'..msg.chat_id_) then lock_kaf ='مفتوح' else lock_kaf ='مقفل' end local XxBOt = "\n" .."⌯︙الكفر ↫ "..lock_kaf.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الفشار" then if bot_data:get(XBOT..'MARTEN:Lock:Fshar'..msg.chat_id_) then lock_fshar ='مفتوح' else lock_fshar ='مقفل' end local XxBOt = "\n" .."⌯︙الفشار ↫ "..lock_fshar.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
if text == "الطائفيه" then if bot_data:get(XBOT..'MARTEN:Lock:Taf'..msg.chat_id_) then lock_taf ='مفتوحه' else lock_taf ='مقفله' end local XxBOt = "\n" .."⌯︙الطائفيه ↫ "..lock_taf.."\n" send(msg.chat_id_, msg.id_, 1, XxBOt, 1, 'md') end
end
--     source -𝐗-     --
if text =='تفعيل كشف الاعدادات' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل كشف الاعدادات بنجاح\n•-› ✓")
bot_data:set(XBOT..'MARTEN:LockSettings'..msg.chat_id_,true)  
end
if text =='تعطيل كشف الاعدادات' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل كشف الاعدادات بنجاح\n•-› X")
bot_data:del(XBOT..'MARTEN:LockSettings'..msg.chat_id_) 
end
--     source -𝐗-     --
if text and (text =='تعطيل التحقق' or text =='قفل التحقق' or text =='تعطيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل التحقق بنجاح\n•-› X")
bot_data:del(XBOT..'MARTEN:Lock:Robot'..msg.chat_id_)
end
if text and (text =='تفعيل التحقق' or text =='فتح التحقق' or text =='تفعيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل التحقق بنجاح\n•-› ✓")
bot_data:set(XBOT..'MARTEN:Lock:Robot'..msg.chat_id_,true)
end
--     source -𝐗-     --
if text =='تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ردود المدير بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:GpRed'..msg.chat_id_)
end
if text =='تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل ردود المدير بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:GpRed'..msg.chat_id_,true)
end
--     source -𝐗-     --
if text =='تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ردود المطور بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:AllRed'..msg.chat_id_)
end
if text =='تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل ردود المطور بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:AllRed'..msg.chat_id_,true)
end
--     source -𝐗-     --
if MARTENSudo(msg) then
if text =='تفعيل المغادره' or text =='↫ تفعيل المغادره ⌯' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل المغادره بنجاح\n•-› ✓")
bot_data:del(XBOT.."MARTEN:Left:Bot"..XBOT)
end
if text =='تعطيل المغادره' or text =='↫ تعطيل المغادره ⌯' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل المغادره بنجاح\n•-› X")
bot_data:set(XBOT.."MARTEN:Left:Bot"..XBOT,true) 
end 
if text =='تفعيل الاذاعه' or text =='↫ تفعيل الاذاعه ⌯' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الاذاعه بنجاح\n•-› ✓")
bot_data:del(XBOT.."MARTEN:Send:Bot"..XBOT)
end
if text =='تعطيل الاذاعه' or text =='↫ تعطيل الاذاعه ⌯' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الاذاعه بنجاح\n•-› X")
bot_data:set(XBOT.."MARTEN:Send:Bot"..XBOT,true) 
end
end
--     source -𝐗-     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"⌯︙البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌯︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تغير اسم المجموعة بنجاح\n•-› ✓")
end
end,nil) 
end
--     source -𝐗-     --
if msg.content_.photo_ then
if bot_data:get(XBOT..'MARTEN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"⌯︙عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
bot_data:del(XBOT..'MARTEN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"⌯︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
bot_data:del(XBOT..'MARTEN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تغير صوره المجموعة بنجاح\n•-› ✓")
end
end,nil) 
bot_data:del(XBOT..'MARTEN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
send(msg.chat_id_,msg.id_, 1, '⌯︙ارسل صورة المجموعه الان', 1, 'md')
bot_data:set(XBOT..'MARTEN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     source -𝐗-     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف صورة المجموعه")  
return false  
end
--     source -𝐗-     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if bot_data:sismember(XBOT.."MARTEN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
bot_data:del(XBOT..'MARTEN:PinnedMsg'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم الغاء تثبيت الرسالة بنجاح\n•-› ✓")
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"⌯︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌯︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     source -𝐗-     --
if text and text:match("^الغاء تثبيت الكل$") and ChCheck(msg) then  
if bot_data:sismember(XBOT.."MARTEN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم الغاء تثبيت الكل بنجاح")
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
bot_data:del(XBOT.."MARTEN:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"⌯︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌯︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     source -𝐗-     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if bot_data:sismember(XBOT.."MARTEN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local PinId = bot_data:get(XBOT..'MARTEN:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم اعاده تثبيت الرسالة بنجاح\n•-› ✓")
end end
end
--     source -𝐗-     --
if text =='طرد المحذوفين' and ChCheck(msg) or text =='مسح المحذوفين' and ChCheck(msg) or text =='طرد الحسابات المحذوفه' and ChCheck(msg) or text =='حذف المحذوفين' and ChCheck(msg) then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم طرد المحذوفين")  
end,nil)
end
--     source -𝐗-     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
send(msg.chat_id_, msg.id_, 0,'⌯︙*لا يوجد محظورين*', 1, 'md')
bot_data:del(XBOT..'MARTEN:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
bot_data:del(XBOT..'MARTEN:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المحظورين")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     source -𝐗-     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = bot_data:scard(XBOT.."MARTEN:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
send(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه ↫ ❨ '..dp.title_..' ❩\n⌯︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n⌯︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n⌯︙عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n⌯︙عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n⌯︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n⌯︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n', 1, 'md') 
end,nil)
end,nil)
end
--     source -𝐗-     --
if text and text:match('^كشف (-%d+)') and ChCheck(msg) then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطورين فقط', 1, 'md')
else
local ConstructorList = bot_data:scard(XBOT.."MARTEN:Constructor:"..ChatId) or 0
local BanedList = bot_data:scard(XBOT.."MARTEN:Ban:"..ChatId) or 0
local ManagerList = bot_data:scard(XBOT.."MARTEN:Managers:"..ChatId) or 0
local MutedList = bot_data:scard(XBOT.."MARTEN:Muted:"..ChatId) or 0
local TkeedList = bot_data:scard(XBOT.."MARTEN:MARTEN:Tkeed:"..ChatId) or 0
local AdminsList = bot_data:scard(XBOT.."MARTEN:Admins:"..ChatId) or 0
local VipList = bot_data:scard(XBOT.."MARTEN:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup ='t.me/SrcX_B0T' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,MARTEN) 
if MARTEN.first_name_ ~= false then
ConstructorMARTEN = "["..MARTEN.first_name_.."](T.me/"..(MARTEN.username_ or "SrcX_B0T")..")"
else 
ConstructorMARTEN = "حساب محذوف"
end
send(msg.chat_id_, msg.id_, 1, "⌯︙المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n⌯︙الايدي ↫ ( `"..ChatId.."` )\n⌯︙المنشئ ↫ "..ConstructorMARTEN.."\n⌯︙عدد المدراء ↫ ( *"..ManagerList.."* )\n⌯︙عدد المنشئين ↫ ( *"..ConstructorList.."* )\n⌯︙عدد الادمنيه ↫ ( *"..AdminsList.."* )\n⌯︙عدد المميزين ↫ ( *"..VipList.."* )\n⌯︙عدد المحظورين ↫ ( *"..BanedList.."* )\n⌯︙عدد المقيدين ↫ ( *"..TkeedList.."* )\n⌯︙عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
send(msg.chat_id_, msg.id_, 1, "⌯︙لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     source -𝐗-     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and SecondSudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and SecondSudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
bot_data:set(XBOT..'MARTEN:Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     source -𝐗-     --
if text =='تفعيل البوت الخدمي' and ChCheck(msg) or text =='↫ تفعيل البوت الخدمي ⌯' and ChCheck(msg) then 
if not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط', 1, 'md')
else 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل البوت الخدمي بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:FreeBot'..XBOT) 
end 
end
if text =='تعطيل البوت الخدمي' and ChCheck(msg) or text =='↫ تعطيل البوت الخدمي ⌯' and ChCheck(msg) then 
if not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط', 1, 'md')
else 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل البوت الخدمي بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:FreeBot'..XBOT,true) 
end 
end
if ChatType =='sp' or ChatType =='gp'  then
if text =='تعطيل صورتي' and Manager(msg) and ChCheck(msg) then   
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل صورتي بنجاح\n•-› X")
bot_data:del(XBOT..'MARTEN:Photo:Profile'..msg.chat_id_) 
end
if text =='تفعيل صورتي' and Manager(msg) and ChCheck(msg) then  
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل صورتي بنجاح\n•-› ✓")
bot_data:set(XBOT..'MARTEN:Photo:Profile'..msg.chat_id_,true)  
end
if text =='تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text =='تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الالعاب بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:Games'..msg.chat_id_) 
end
if text =='تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text =='تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الالعاب بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:Games'..msg.chat_id_,true)  
end
if text =='تفعيل الالعاب المتطوره' and Manager(msg) and ChCheck(msg) or text =='تفعيل الالعاب الاحترافيه' and Manager(msg) and ChCheck(msg) then   
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الالعاب المتطوره بنجاح\n•-› ✓")
bot_data:del(XBOT..'MARTEN:Lock:Gamesinline'..msg.chat_id_) 
end
if text =='تعطيل الالعاب المتطوره' and Manager(msg) and ChCheck(msg) or text =='تعطيل الالعاب الاحترافيه' and Manager(msg) and ChCheck(msg) then  
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الالعاب المتطوره بنجاح\n•-› X")
bot_data:set(XBOT..'MARTEN:Lock:Gamesinline'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" and ChCheck(msg) or text == "تفعيل جلب الرابط" and ChCheck(msg) then 
if Admin(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل جلب رابط المجموعه بنجاح\n•-› ✓")
bot_data:del(XBOT.."MARTEN:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" and ChCheck(msg) or text == "تعطيل جلب الرابط" and ChCheck(msg) then 
if Admin(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل جلب رابط المجموعه بنجاح\n•-› X")
bot_data:set(XBOT.."MARTEN:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
if text == "تعطيل الرابط انلاين" and ChCheck(msg) or text == "تعطيل جلب الرابط انلاين" and ChCheck(msg) then 
if Admin(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل جلب رابط انلاين المجموعه\n•-› X")
bot_data:set(XBOT.."MARTEN:Lock:GpLinksinline"..msg.chat_id_,"ok")
return false  
end
end
if text == "تفعيل الرابط انلاين" and ChCheck(msg) or text == "تفعيل جلب الرابط انلاين" and ChCheck(msg) then 
if Admin(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل جلب رابط انلاين المجموعه\n•-› ✓")
bot_data:del(XBOT.."MARTEN:Lock:GpLinksinline"..msg.chat_id_)
return false  
end
end

if text and (text == "تفعيل انا" or text == "تفعيل اني" or text == "تفعيل من انا" or text == "تفعيل me") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر انا او اني\n•-› ✓")
bot_data:del(XBOT.."MARTEN:ME"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل انا" or text == "تعطيل اني" or text == "تعطيل من انا" or text == "تعطيل me") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر انا او اني\n•-› X")
bot_data:set(XBOT.."MARTEN:ME"..msg.chat_id_,true)
return false  
end
end

if text and (text == "تفعيل حذف ردود المطور" or text == "تفعيل مسح ردود المطور" or text == "تفعيل حذف عام" or text == "تفعيل حذف ردود للكل") and ChCheck(msg) then 
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل حذف ردود المطور\n•-› ✓")
bot_data:del(XBOT.."MARTEN:Lock:all"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل حذف ردود المطور" or text == "تعطيل مسح ردود المطور" or text == "تعطيل حذف عام" or text == "تعطيل حذف ردود للكل") and ChCheck(msg) then 
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل حذف ردود المطور\n•-› X")
bot_data:set(XBOT.."MARTEN:Lock:all"..msg.chat_id_,true)
return false  
end
end
if text and (text == "تفعيل اضف رد المطور" or text == "تفعيل اضافه رد المطور" or text == "تفعيل اضف رد للكل" or text == "تفعيل اضافه رد عام" or text == "تفعيل اضف رد عام") and ChCheck(msg) then 
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل اضف رد عام\n•-› ✓")
bot_data:del(XBOT.."MARTEN:unLock:all"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل اضف رد المطور" or text == "تعطيل اضافه رد المطور" or text == "تعطيل اضف رد للكل" or text == "تعطيل اضافه رد عام" or text == "تعطيل اضف رد عام") and ChCheck(msg) then 
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل اضف رد عام\n•-› X")
bot_data:set(XBOT.."MARTEN:unLock:all"..msg.chat_id_,true)
return false  
end
end


if text and (text == "تفعيل حذف ردود المدير" or text == "تفعيل مسح ردود المدير" or text == "تفعيل حذف رد" or text == "تفعيل حذف ردود") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل حذف ردود المدير\n•-› ✓")
bot_data:del(XBOT.."MARTEN:Lock:GpRd"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل حذف ردود المدير" or text == "تعطيل مسح ردود المدير" or text == "تعطيل حذف رد" or text == "تعطيل حذف ردود") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل حذف ردود المدير\n•-› X")
bot_data:set(XBOT.."MARTEN:Lock:GpRd"..msg.chat_id_,true)
return false  
end
end
if text and (text == "تفعيل اضف رد المدير" or text == "تفعيل اضافه رد المدير" or text == "تفعيل اضف رد" or text == "تفعيل اضافه رد" or text == "تفعيل اضف رد") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل اضف رد \n•-› ✓")
bot_data:del(XBOT.."MARTEN:unLock:GpRd"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل اضف رد المدير" or text == "تعطيل اضافه رد المدير" or text == "تعطيل اضف رد" or text == "تعطيل اضافه رد" or text == "تعطيل اضف رد") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل اضف رد \n•-› X")
bot_data:set(XBOT.."MARTEN:unLock:GpRd"..msg.chat_id_,true)
return false  
end
end

if text and (text == "تفعيل حذف ردود المتعدد" or text == "تفعيل مسح ردود المتعدد" or text == "تفعيل حذف رد متعدد" or text == "تفعيل حذف ردود متعدد") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل حذف ردود المتعدد\n•-› ✓")
bot_data:del(XBOT.."MARTEN:Lock:Rd123"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل حذف ردود المتعدد" or text == "تعطيل مسح ردود المتعدد" or text == "تعطيل حذف رد متعدد" or text == "تعطيل حذف ردود المتعدد") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل حذف ردود المتعدد\n•-› X")
bot_data:set(XBOT.."MARTEN:Lock:Rd123"..msg.chat_id_,true)
return false  
end
end
if text and (text == "تفعيل اضف رد المتعدد" or text == "تفعيل اضافه رد المتعدد" or text == "تفعيل اضف رد متعدد" or text == "تفعيل اضافه رد متعدد" or text == "تفعيل اضف رد متعدد") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل اضف رد متعدد\n•-› ✓")
bot_data:del(XBOT.."MARTEN:unLock:Rd123"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل اضف رد المتعدد" or text == "تعطيل اضافه رد المتعدد" or text == "تعطيل اضف رد متعدد" or text == "تعطيل اضافه رد متعدد" or text == "تعطيل اضف رد متعدد") and ChCheck(msg) then 
if not MARTENConstructor(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل اضف رد متعدد\n•-› X")
bot_data:set(XBOT.."MARTEN:unLock:Rd123"..msg.chat_id_,true)
return false  
end
end
--     source -𝐗-     --
if text and text:match('^تفعيل$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~='sp' then
send(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_, 1, '⌯︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(bot_data:get(XBOT..'MARTEN:Num:Add:Bot') or 0) and not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙عدد اعضاء المجموعه اقل من ↫ *'..(bot_data:get(XBOT..'MARTEN:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoFi) 
local admins = SoFi.members_
for i=0 , #admins do
if SoFi.members_[i].bot_info_ == false and SoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
bot_data:sadd(XBOT..'MARTEN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if SoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then
bot_data:sadd(XBOT.."MARTEN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
bot_data:sadd(XBOT.."MARTEN:MARTENConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
bot_data:srem(XBOT.."MARTEN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
bot_data:srem(XBOT.."MARTEN:MARTENConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if bot_data:sismember(XBOT..'MARTEN:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه بالتاكيد مفعله', 1, 'md')
else
Text = "⌯︙تم تفعيل المجموعه "..dp.title_
local inline = {{{text="• ترتيب الاوامر •",callback_data="/SetCmdGp:"..msg.sender_user_id_},{text="• رفع الادمنيه •",callback_data="/UploadAdmin:"..msg.sender_user_id_}},{{text="• غادر •",callback_data="/LeaveBot:"..msg.sender_user_id_},{text="• تعطيل •",callback_data="/Stop:"..msg.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
bot_data:sadd(XBOT.."MARTEN:Groups",msg.chat_id_)
if not bot_data:get(XBOT..'MARTEN:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
bot_data:incrby(XBOT..'MARTEN:Sudos'..msg.sender_user_id_,1)
bot_data:set(XBOT..'MARTEN:SudosGp'..msg.sender_user_id_..msg.chat_id_,"SoFi")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup ='لا يوجد'
end
bot_data:set(XBOT.."MARTEN:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(XBoT,"⌯︙تم تفعيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text =='تعطيل' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not bot_data:sismember(XBOT..'MARTEN:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه بالتاكيد معطله', 1, 'md')
else
Text = "⌯︙تم تعطيل المجموعه "..dp.title_
local inline = {{{text="• غادر •",callback_data="/LeaveBot:"..msg.sender_user_id_},{text="• تفعيل •",callback_data="/On:"..msg.sender_user_id_}},{{text="سـوࢪس أڪـس  メ",url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
bot_data:srem(XBOT.."MARTEN:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup ='لا يوجد'
end
bot_data:set(XBOT.."MARTEN:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(XBoT,"⌯︙تم تعطيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     source -𝐗-     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name ='['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩"
else
LinkGroup ='⌯︙ليست لدي صلاحية الدعوه لهذه المجموعه !'
end
if not Sudo(msg) then
SendText(XBoT,"⌯︙هناك من بحاجه الى مساعده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الشخص ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n"..LinkGroup.."\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     source -𝐗-     --
if text =='روابط الكروبات' or text =='روابط المجموعات' or text =='↫ روابط المجموعات ⌯' then
if not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
local List = bot_data:smembers(XBOT.."MARTEN:Groups")
if #List == 0 then
send(msg.chat_id_, msg.id_, 1, '⌯︙لا توجد مجموعات مفعله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⌯︙جاري ارسال نسخه تحتوي على ↫ '..#List..' مجموعه', 1, 'md')
local Text = "⌯︙source -𝐗-\n⌯︙File Bot Groups\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local GroupsManagers = bot_data:scard(XBOT.."MARTEN:Managers:"..v) or 0
local GroupsAdmins = bot_data:scard(XBOT.."MARTEN:Admins:"..v) or 0
local Groupslink = bot_data:get(XBOT.."MARTEN:Groups:Links" ..v)
Text = Text..k.." ↬ ⤈ \n⌯︙Group ID ↬ "..v.."\n⌯︙Group Link ↬ "..(Groupslink or "Not Found").."\n⌯︙Group Managers ↬ "..GroupsManagers.."\n⌯︙Group Admins ↬ "..GroupsAdmins.."\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     source -𝐗-     --
if text == "اذاعه خاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه خاص ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if bot_data:get(XBOT.."MARTEN:Send:Bot"..XBOT) and not MARTENSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
bot_data:setex(XBOT.."MARTEN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if bot_data:get(XBOT.."MARTEN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text =='الغاء' then   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = bot_data:smembers(XBOT..'MARTEN:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
MARTENText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
MARTENText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
MARTENText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
MARTENText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
MARTENText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
MARTENText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
MARTENText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
MARTENText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة "..MARTENText.." بنجاح \n⌯︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     source -𝐗-     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه عام ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if bot_data:get(XBOT.."MARTEN:Send:Bot"..XBOT) and not MARTENSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
bot_data:setex(XBOT.."MARTEN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if bot_data:get(XBOT.."MARTEN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text =='الغاء' then   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = bot_data:smembers(XBOT..'MARTEN:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
MARTENText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
MARTENText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
MARTENText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
MARTENText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
MARTENText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
MARTENText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
MARTENText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
MARTENText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة "..MARTENText.." بنجاح \n⌯︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     source -𝐗-     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه عام بالتوجيه ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if bot_data:get(XBOT.."MARTEN:Send:Bot"..XBOT) and not MARTENSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
bot_data:setex(XBOT.."MARTEN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل الرساله الان لتوجيها \n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if bot_data:get(XBOT.."MARTEN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text =='الغاء' then   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = bot_data:smembers(XBOT..'MARTEN:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة رسالتك بالتوجيه \n⌯︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     source -𝐗-     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه خاص بالتوجيه ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if bot_data:get(XBOT.."MARTEN:Send:Bot"..XBOT) and not MARTENSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
bot_data:setex(XBOT.."MARTEN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل الرساله الان لتوجيها \n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if bot_data:get(XBOT.."MARTEN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text =='الغاء' then   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = bot_data:smembers(XBOT..'MARTEN:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة رسالتك بالتوجيه \n⌯︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     source -𝐗-     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه بالتثبيت ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if bot_data:get(XBOT.."MARTEN:Send:Bot"..XBOT) and not MARTENSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
bot_data:setex(XBOT.."MARTEN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if bot_data:get(XBOT.."MARTEN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = bot_data:smembers(XBOT.."MARTEN:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
MARTENText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
MARTENText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
MARTENText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
MARTENText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
MARTENText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
MARTENText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
MARTENText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
MARTENText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
bot_data:set(XBOT..'MARTEN:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة "..MARTENText.." بالتثبيت \n⌯︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
bot_data:del(XBOT.."MARTEN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     source -𝐗-     --
if text and (text =='حذف رد من متعدد' or text =='مسح رد من متعدد') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:Lock:Rd123'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير واعلى فقط ', 1, 'md')
else
local List = bot_data:smembers(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end end
bot_data:set(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
send(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل كلمة الرد اولا" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = bot_data:get(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod =='DelGpRedRedod' then
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not bot_data:sismember(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_,text) then
send(msg.chat_id_, msg.id_, 1, "⌯︙لايوجد رد متعدد لهذه الكلمه ↫ "..text ,  1, "md")
return false
end
send(msg.chat_id_, msg.id_, 1, "⌯︙قم بارسال الرد المتعدد الذي تريد حذفه من الكلمه ↫ "..text ,  1, "md")
bot_data:set(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
bot_data:set(XBOT..'MARTEN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text and (text =='حذف رد متعدد' or text =='مسح رد متعدد') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:Lock:Rd123'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير واعلى فقط ', 1, 'md')
else
local List = bot_data:smembers(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end end
bot_data:set(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
send(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه لحذفها" ,  1, "md")
return false
end
if text =='اضف رد متعدد' and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:unLock:Rd123'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير واعلى فقط ', 1, 'md')
else
bot_data:set(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
send(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه الان" ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRedod = bot_data:get(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod =='SetGpRedod' then
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if bot_data:sismember(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_,text) then
local MARTEN = "⌯︙لاتستطيع اضافة رد بالتاكيد مضاف في القائمه قم بحذفه اولا !"
local inline = {{{text="• حذف الرد ↫ "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
SendInline(msg.chat_id_,MARTEN,nil,inline,msg.id_/2097152/0.5)
bot_data:del(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الامر ارسل الرد الاول\n⌯︙للخروج ارسل ↫ ( الغاء )" ,  1, "md")
bot_data:set(XBOT..'MARTEN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
bot_data:set(XBOT..'MARTEN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
bot_data:sadd(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     source -𝐗-     --
if text =='اضف كت' and ChCheck(msg) then
bot_data:set(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_,'SetKt')
send(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل امر `كت تويت` الان" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetKt = bot_data:get(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
if SetKt =='SetKt' then
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
return false
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الامر ارسل السؤال الاول\n⌯︙للخروج ارسل ↫ ( الغاء )" ,  1, "md")
bot_data:set(XBOT..'MARTEN:Add:Kt'..msg.sender_user_id_..msg.chat_id_,'SaveKt')
bot_data:set(XBOT..'MARTEN:Add:KtTexts'..msg.sender_user_id_..msg.chat_id_,text)
bot_data:sadd(XBOT..'MARTEN:Sudo:Kt'..msg.chat_id_,text)
return false
end end
--     source -𝐗-     --
if text and (text =='حذف رد' or text =='مسح رد') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:Lock:GpRd'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير واعلى فقط ', 1, 'md')
return false
end
bot_data:set(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
send(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text and (text =='اضف رد' or text =='اضافه رد' or text =='اضافة رد') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:unLock:GpRd'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير واعلى فقط ', 1, 'md')
else
bot_data:set(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
send(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRed = bot_data:get(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed =='SetGpRed' then
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Text = "⌯︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙يمكنك اضافة الى النص ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙🌐 `#username` ↬ معرف المستخدم\n⌯︙📎 `#name` ↬ اسم المستخدم\n⌯︙🆔 `#id` ↬ ايدي المستخدم\n⌯︙✏️ `#bio` ↬ نبذا المستخدم\n⌯︙🎖 `#stast` ↬ رتبة المستخدم\n⌯︙📨 `#msgs` ↬ عدد الرسائل\n⌯︙📝 `#edit` ↬ عدد السحكات\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙للخروج ارسل ↫ ( الغاء )\n ✓"
bot_data:set(XBOT..'MARTEN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
bot_data:set(XBOT..'MARTEN:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
bot_data:sadd(XBOT..'MARTEN:Manager:GpRed'..msg.chat_id_,text)
bot_data:set(XBOT..'DelManagerRep'..msg.chat_id_,text)
local inline = {{{text="• تغير الرد •",callback_data="/ChangeRed:"..msg.sender_user_id_}},{{text="• الغاء •",callback_data="/CancelRed:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
return false
end end
--     source -𝐗-     --
if text and (text =='حذف رد عام' or text =='↫ حذف رد عام ⌯' or text =='مسح رد عام' or text =='حذف رد للكل' or text =='مسح رد للكل' or text =='مسح رد مطور' or text =='حذف رد مطور') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:Lock:all'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
local List = bot_data:smembers(XBOT.."MARTEN:Sudo:AllRed")
if #List == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود مضافه" ,  1, "md")
else
send(msg.chat_id_, msg.id_,"⌯︙ارسل الكلمه التري تريد حذفها")
bot_data:set(XBOT.."MARTEN:Sudo:AllRed"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end end end
if text and (text =='اضف رد عام' or text =='↫ اضف رد عام ⌯' or text =='اضف رد للكل' or text =='اضف رد مطور') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:unLock:all'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
bot_data:set(XBOT.."MARTEN:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
send(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetAllRed = bot_data:get(XBOT.."MARTEN:Add:AllRed"..msg.sender_user_id_)
if SetAllRed =='SetAllRed' then
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
bot_data:del(XBOT..'MARTEN:Add:AllRed'..msg.sender_user_id_)
return false
end
Text = "⌯︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙يمكنك اضافة الى النص ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙🌐 `#username` ↬ معرف المستخدم\n⌯︙📎 `#name` ↬ اسم المستخدم\n⌯︙🆔 `#id` ↬ ايدي المستخدم\n⌯︙✏️ `#bio` ↬ نبذا المستخدم\n⌯︙🎖 `#stast` ↬ رتبة المستخدم\n⌯︙📨 `#msgs` ↬ عدد الرسائل\n⌯︙📝 `#edit` ↬ عدد السحكات\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙للخروج ارسل ↫ ( الغاء )\n ✓"
bot_data:set(XBOT.."MARTEN:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
bot_data:set(XBOT.."MARTEN:Add:AllText"..msg.sender_user_id_, text)
bot_data:sadd(XBOT.."MARTEN:Sudo:AllRed",text)
bot_data:set(XBOT.."DelSudoRep",text)
local inline = {{{text="• تغير الرد •",callback_data="/ChangeAllRed:"..msg.sender_user_id_}},{{text="• الغاء •",callback_data="/CancelAllRed:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
return false
end end
--     source -𝐗-     --
if text =='الردود المتعدده' and ChCheck(msg) then
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير واعلى فقط ', 1, 'md')
else
local redod = bot_data:smembers(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_)
MsgRep ='⌯︙قائمة الردود المتعدده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) • {*العدد ↫ '..#bot_data:smembers(XBOT..'MARTEN:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep ='⌯︙لا توجد ردود متعدده مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text =='حذف الردود المتعدده' or text =='مسح الردود المتعدده') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:Lock:GpRd'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع حذف ردود المتعدده وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير او اعلى فقط ', 1, 'md')
else
local redod = bot_data:smembers(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود متعدده مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
bot_data:del(XBOT..'MARTEN:Text:GpTexts'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الردود المتعدده")  
return false
end
end
end
end
--     source -𝐗-     --
if text =='الردود' and Manager(msg) and ChCheck(msg) or text =='ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = bot_data:smembers(XBOT..'MARTEN:Manager:GpRed'..msg.chat_id_)
MsgRep ='⌯︙ردود المدير ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for k,v in pairs(redod) do
if bot_data:get(XBOT.."MARTEN:Gif:GpRed"..v..msg.chat_id_) then
dp ='متحركه 🎭'
elseif bot_data:get(XBOT.."MARTEN:Voice:GpRed"..v..msg.chat_id_) then
dp ='بصمه 🎙'
elseif bot_data:get(XBOT.."MARTEN:Stecker:GpRed"..v..msg.chat_id_) then
dp ='ملصق 🃏'
elseif bot_data:get(XBOT.."MARTEN:Text:GpRed"..v..msg.chat_id_) then
dp ='رساله ✉'
elseif bot_data:get(XBOT.."MARTEN:Photo:GpRed"..v..msg.chat_id_) then
dp ='صوره 🎇'
elseif bot_data:get(XBOT.."MARTEN:Video:GpRed"..v..msg.chat_id_) then
dp ='فيديو 📽'
elseif bot_data:get(XBOT.."MARTEN:File:GpRed"..v..msg.chat_id_) then
dp ='ملف 📁'
elseif bot_data:get(XBOT.."MARTEN:Audio:GpRed"..v..msg.chat_id_) then
dp ='اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep ='*⌯︙لا توجد ردود مضافه*'
end
local inline = {{{text="• مسح ردود المدير •",callback_data="/DelGpRed:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,MsgRep,nil,inline,msg.id_/2097152/0.5)
end
if text and (text =='حذف الردود' or text =='مسح الردود' or text =='حذف ردود المدير' or text =='مسح ردود المدير') and ChCheck(msg) then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:Lock:GpRd'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع حذف ردود المدير وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمدير او اعلى فقط ', 1, 'md')
else
local redod = bot_data:smembers(XBOT..'MARTEN:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
bot_data:del(XBOT..'MARTEN:Gif:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Voice:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Audio:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Photo:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Stecker:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Video:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:File:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Text:GpRed'..v..msg.chat_id_)
bot_data:del(XBOT..'MARTEN:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف ردود المدير")  
return false
end
end
end
--     source -𝐗-     --
if  text == "ردود المطور" and SecondSudo(msg) or text == "الردود العام" and SecondSudo(msg) or text == "ردود العام" and SecondSudo(msg) or text == "↫ الردود العام ⌯" and SecondSudo(msg) then
local redod = bot_data:smembers(XBOT.."MARTEN:Sudo:AllRed")
MsgRep ='⌯︙ردود المطور ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for k,v in pairs(redod) do
if bot_data:get(XBOT.."MARTEN:Gif:AllRed"..v) then
dp ='متحركه 🎭'
elseif bot_data:get(XBOT.."MARTEN:Voice:AllRed"..v) then
dp ='بصمه 🎙'
elseif bot_data:get(XBOT.."MARTEN:Stecker:AllRed"..v) then
dp ='ملصق 🃏'
elseif bot_data:get(XBOT.."MARTEN:Text:AllRed"..v) then
dp ='رساله ✉'
elseif bot_data:get(XBOT.."MARTEN:Photo:AllRed"..v) then
dp ='صوره 🎇'
elseif bot_data:get(XBOT.."MARTEN:Video:AllRed"..v) then
dp ='فيديو 📽'
elseif bot_data:get(XBOT.."MARTEN:File:AllRed"..v) then
dp ='ملف 📁'
elseif bot_data:get(XBOT.."MARTEN:Audio:AllRed"..v) then
dp ='اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep ='*⌯︙لا توجد ردود مضافه*'
end
local inline = {{{text="• مسح ردود المطور •",callback_data="/DelGpRedAll:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,MsgRep,nil,inline,msg.id_/2097152/0.5)
end
if text and (text == "حذف ردود المطور" or text == "حذف ردود العام" or text == "مسح ردود المطور" or text == "↫ مسح ردود العام ⌯") then
if not Bot(msg) and bot_data:get(XBOT..'MARTEN:Lock:GpRd'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع حذف ردود المطور وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الثانوي او اعلى فقط ', 1, 'md')
else
local redod = bot_data:smembers(XBOT.."MARTEN:Sudo:AllRed")
if #redod == 0 then
send(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
bot_data:del(XBOT.."MARTEN:Add:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Gif:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Voice:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Audio:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Photo:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Stecker:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Video:AllRed"..v)
bot_data:del(XBOT.."MARTEN:File:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Text:AllRed"..v)
bot_data:del(XBOT.."MARTEN:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف ردود المطور")  
return false
end
end 
end
--     source -𝐗-     --
if text and text == "تغيير اسم البوت" and ChCheck(msg) or text and text == "وضع اسم البوت" and ChCheck(msg) or text and text == "تغير اسم البوت" and ChCheck(msg) then
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي اسم البوت الان" ,  1, "md") 
bot_data:set(XBOT..'MARTEN:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text =='حذف اسم البوت' and ChCheck(msg) or text =='مسح اسم البوت' and ChCheck(msg) then
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
bot_data:del(XBOT..'MARTEN:NameBot')
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم حذف اسم البوت")
end end 
--     source -𝐗-     --
if text and text:match("^استعاده الاوامر$") and SecondSudo(msg) and ChCheck(msg) or text and text:match("^استعادة كلايش الاوامر$") and SecondSudo(msg) and ChCheck(msg) then
HelpList ={'MARTEN:Help','MARTEN:Help1','MARTEN:Help2','MARTEN:Help3','MARTEN:Help4','MARTEN:Help5','MARTEN:Help6'}
for i,Help in pairs(HelpList) do
bot_data:del(XBOT..Help) 
end
send(msg.chat_id_, msg.id_, 1, "⌯︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text == "تعيين الاوامر" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر الاوامر" and SecondSudo(msg) and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (الاوامر) الان " ,  1, "md")
bot_data:set(XBOT..'MARTEN:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local XxBOt =  bot_data:get(XBOT..'MARTEN:Help0'..msg.sender_user_id_)
if XxBOt =='msg' then
send(msg.chat_id_, msg.id_, 1, text , 1, 'md')
bot_data:del(XBOT..'MARTEN:Help0'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Help', text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "الاوامر" and ChCheck(msg) or text == "اوامر" and ChCheck(msg) or text == "مساعده" and ChCheck(msg) then
local Help = bot_data:get(XBOT..'MARTEN:Help')
local Text = [[
⚙️ | اهلاً أنتَ في أوامر البوت الرئيسية 🔏
⚙️ | أختر في الاسفل الأمر المراد  🔍 .
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙ • ↫ اوامر الحمايـة .
⌯︙ • ↫ اوامر الادمنيـة . 
⌯︙ • ↫ اوامر المـدراء .
⌯︙ • ↫ اوامر المنشئيـن .
⌯︙ • ↫ اوامر المطوريـن .
⌯︙ • ↫ اوامر الاعضـاء .
⌯︙ • ↫ اوامر الرتـب .
⌯︙ • ↫ القفل والفـتح .
⌯︙ • ↫ التفعيل والتعطـيل .
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
if SudoBot(msg) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..msg.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..msg.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..msg.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="• اوامر الرتب •",callback_data="/DelList:"..msg.sender_user_id_}},{{text="• التفعيل و التعطيل •",callback_data="/lockorder:"..msg.sender_user_id_},{text="• القفل و الفتح •",callback_data="/locklist:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
elseif Constructor(msg) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..msg.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..msg.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="• اوامر الرتب •",callback_data="/DelList:"..msg.sender_user_id_}},{{text="• التفعيل و التعطيل •",callback_data="/lockorder:"..msg.sender_user_id_},{text="• القفل و الفتح •",callback_data="/locklist:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
elseif Manager(msg) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..msg.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..msg.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="• اوامر الرتب •",callback_data="/DelList:"..msg.sender_user_id_}},{{text="• التفعيل و التعطيل •",callback_data="/lockorder:"..msg.sender_user_id_},{text="• القفل و الفتح •",callback_data="/locklist:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
elseif Admin(msg) then
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..msg.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="• اوامر الرتب •",callback_data="/DelList:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
else
keyboard.inline_keyboard = {{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
end
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تعيين امر م1" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م١" and SecondSudo(msg) and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م1) الان " ,  1, "md")
bot_data:set(XBOT..'MARTEN:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local XxBOt =  bot_data:get(XBOT..'MARTEN:Help01'..msg.sender_user_id_)
if XxBOt =='msg' then 
send(msg.chat_id_, msg.id_, 1, text , 1, 'md')
bot_data:del(XBOT..'MARTEN:Help01'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Help1', text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م1" or text == "م١" or text == "اوامر1" or text == "اوامر١" then
if not Admin(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = bot_data:get(XBOT..'MARTEN:Help1')
local Text = [[
⌯︙اوامر حمايـة المجموعـة ↫ ⤈ 👨🏻‍💻
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • قفل • فتح ↫ الروابط
 • قفل • فتح ↫ المعرفات
 • قفل • فتح ↫ البوتات
 • قفل • فتح ↫ المتحركه
 • قفل • فتح ↫ الملصقات
 • قفل • فتح ↫ الملفات
 • قفل • فتح ↫ الصور
 • قفل • فتح ↫ الفيديو
 • قفل • فتح ↫ الاونلاين
 • قفل • فتح ↫ الدردشه
 • قفل • فتح ↫ التوجيه
 • قفل • فتح ↫ الاغاني
 • قفل • فتح ↫ الصوت
 • قفل • فتح ↫ الجهات
 • قفل • فتح ↫ الماركداون
 • قفل • فتح ↫ التكرار
 • قفل • فتح ↫ الهاشتاك
 • قفل • فتح ↫ التعديل
 • قفل • فتح ↫ التثبيت
 • قفل • فتح ↫ الاشعارات
 • قفل • فتح ↫ الكلايش
 • قفل • فتح ↫ الدخول
 • قفل • فتح ↫ الشبكات
 • قفل • فتح ↫ المواقع
 • قفل • فتح ↫ الفشار
 • قفل • فتح ↫ الكفر
 • قفل • فتح ↫ الطائفيه
 • قفل • فتح ↫ الكل
 • قفل • فتح ↫ العربيه 
 • قفل • فتح ↫ الاباحي
 • قفل • فتح ↫ الانكليزيه
 • قفل • فتح ↫ الفارسيه
 • قفل • فتح ↫ التفليش
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر حمايه اخرى ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • قفل • فتح + الامر ↫ ⤈
 • التكرار بالطرد
 • التكرار بالكتم
 • التكرار بالتقيد
 • الفارسيه بالطرد
 • البوتات بالطرد
 • البوتات بالتقيد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
send(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م2" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٢" and SecondSudo(msg) and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م2) الان " ,  1, "md")
bot_data:set(XBOT..'MARTEN:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local XxBOt =  bot_data:get(XBOT..'MARTEN:Help21'..msg.sender_user_id_)
if XxBOt =='msg' then
send(msg.chat_id_, msg.id_, 1, text , 1, 'md')
bot_data:del(XBOT..'MARTEN:Help21'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Help2', text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م2" and ChCheck(msg) or text == "م٢" and ChCheck(msg) or text == "اوامر2" and ChCheck(msg) or text == "اوامر٢" and ChCheck(msg) then
if not Admin(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = bot_data:get(XBOT..'MARTEN:Help2')
local Text = [[
⌯︙اوامر الادمنيـة ↫ ⤈ 👨🏻‍🔧
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • الاعدادت
 • تاك للكل 
 • انشاء رابط
 • ضع وصف
 • ضع رابط
 • ضع صوره
 • حذف الرابط
 • كشف البوتات
 • طرد البوتات
 • تنظيف + العدد
 • تنظيف التعديل
 • كللهم + الكلمه
 • اسم البوت + الامر
 • ضع • حذف ↫ ترحيب
 • ضع • حذف ↫ قوانين
 • اضف • حذف ↫ صلاحيه
 • الصلاحيات • حذف الصلاحيات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • ضع سبام + العدد
 • ضع تكرار + العدد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • رفع مميز • تنزيل مميز
 • المميزين • حذف المميزين
 • كشف القيود • رفع القيود
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • حذف • مسح + بالرد
 • منع • الغاء منع
 • قائمه المنع
 • حذف قائمه المنع
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تفعيل • تعطيل ↫ الرابط
 • تفعيل • تعطيل ↫ الالعاب
 • تفعيل • تعطيل ↫ الترحيب
 • تفعيل • تعطيل ↫ التاك للكل
 • تفعيل • تعطيل ↫ كشف الاعدادات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • طرد المحذوفين
 • طرد ↫ بالرد • بالمعرف • بالايدي
 • كتم • الغاء كتم
 • تقيد • الغاء تقيد
 • حظر • الغاء حظر
 • المكتومين • حذف المكتومين
 • المقيدين • حذف المقيدين
 • المحظورين • حذف المحظورين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تقييد دقيقه + عدد الدقائق
 • تقييد ساعه + عدد الساعات
 • تقييد يوم + عدد الايام
 • الغاء تقييد ↫ لالغاء التقييد بالوقت
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
send(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م3" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٣" and SecondSudo(msg) and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م3) الان " ,  1, "md")
bot_data:set(XBOT..'MARTEN:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local XxBOt =  bot_data:get(XBOT..'MARTEN:Help31'..msg.sender_user_id_)
if XxBOt =='msg' then
send(msg.chat_id_, msg.id_, 1, text , 1, 'md')
bot_data:del(XBOT..'MARTEN:Help31'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Help3', text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م3" and ChCheck(msg) or text == "م٣" and ChCheck(msg) or text == "اوامر3" and ChCheck(msg) or text == "اوامر٣" and ChCheck(msg) then
if not Admin(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = bot_data:get(XBOT..'MARTEN:Help3')
local Text = [[
⌯︙اوامر المـدراء ↫ ⤈ 👨🏼‍✈️
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • فحص البوت
 • ضع اسم + الاسم
 • اضف • حذف ↫ رد
 • ردود المدير
 • حذف ردود المدير
 • اضف • حذف ↫ رد متعدد
 • حذف رد من متعدد
 • الردود المتعدده
 • حذف الردود المتعدده
 • حذف قوائم المنع
 • منع ↫ بالرد على ( ملصق • صوره • متحركه )
 • حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تنزيل الكل
 • رفع ادمن • تنزيل ادمن
 • الادمنيه • حذف الادمنيه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تثبيت
 • الغاء التثبيت
 • اعاده التثبيت
 • الغاء تثبيت الكل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تغير رد + اسم الرتبه + النص ↫ ⤈
 • المطور • منشئ الاساسي
 • المنشئ • المدير • الادمن
 • المميز • المنظف • العضو
 • حذف ردود الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تغيير الايدي ↫ لتغيير الكليشه
 • تعيين الايدي ↫ لتعيين الكليشه
 • حذف الايدي ↫ لحذف الكليشه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تفعيل • تعطيل + الامر ↫ ⤈
 • اطردني • الايدي بالصوره • الابراج
 • معاني الاسماء • اوامر النسب • انطق
 • الايدي • تحويل الصيغ • اوامر التحشيش
 • ردود المدير • ردود المطور • التحقق
 • ضافني • حساب العمر • الزخرفه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
send(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م4" and ChCheck(msg) and SecondSudo(msg) or text == "تعيين امر م٤" and SecondSudo(msg) and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م4) الان " ,  1, "md")
bot_data:set(XBOT..'MARTEN:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local XxBOt =  bot_data:get(XBOT..'MARTEN:Help41'..msg.sender_user_id_)
if XxBOt =='msg' then
send(msg.chat_id_, msg.id_, 1, text , 1, 'md')
bot_data:del(XBOT..'MARTEN:Help41'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Help4', text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٤" and ChCheck(msg) or text == "م4" and ChCheck(msg) or text == "اوامر4" and ChCheck(msg) or text == "اوامر٤" and ChCheck(msg) then
if not Admin(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = bot_data:get(XBOT..'MARTEN:Help4')
local Text = [[
⌯︙اوامر المنشئيـن ↫ ⤈ 🤵🏼‍♂️
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تنزيل الكل
 • الميديا • امسح
 • تعين عدد الحذف
 • ترتيب الاوامر
 • اضف • حذف ↫ امر
 • حذف الاوامر المضافه
 • الاوامر المضافه
 • اضف نقاط ↫ بالرد • بالايدي
 • اضف رسائل ↫ بالرد • بالايدي
 • رفع منظف • تنزيل منظف
 • المنظفين • حذف المنظفين
 • رفع مدير • تنزيل مدير
 • المدراء • حذف المدراء
 • تفعيل • تعطيل + الامر ↫ ⤈
 • نزلني • امسح
 • الحظر • الكتم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المنشئين الاساسيين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • وضع لقب + اللقب
 • تفعيل • تعطيل ↫ الرفع
 • رفع منشئ • تنزيل منشئ
 • المنشئين • حذف المنشئين
 • رفع • تنزيل ↫ مشرف
 • رفع بكل الصلاحيات
 • حذف القوائم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المالكين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • رفع • تنزيل ↫ منشئ اساسي
 • حذف المنشئين الاساسيين 
 • المنشئين الاساسيين 
 • حذف جميع الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
send(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م5" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٥" and SecondSudo(msg) and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م5) الان " ,  1, "md")
bot_data:set(XBOT..'MARTEN:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local XxBOt =  bot_data:get(XBOT..'MARTEN:Help51'..msg.sender_user_id_)
if XxBOt =='msg' then
send(msg.chat_id_, msg.id_, 1, text , 1, 'md')
bot_data:del(XBOT..'MARTEN:Help51'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Help5', text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م٥" and ChCheck(msg) or text == "م5" and ChCheck(msg) or text == "اوامر5" and ChCheck(msg) or text == "اوامر٥" and ChCheck(msg) then
if not SudoBot(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمطورين فقط', 1, 'md')
else
local Help = bot_data:get(XBOT..'MARTEN:Help5')
local Text = [[
⌯︙اوامر المطوريـن ↫ ⤈ 👨🏼‍✈️
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • الكروبات
 • المطورين
 • المشتركين
 • الاحصائيات
 • المجموعات
 • اسم البوت + غادر
 • اسم البوت + تعطيل
 • كشف + -ايدي المجموعه
 • رفع مالك • تنزيل مالك
 • المالكين • حذف المالكين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • رفع • تنزيل ↫ مدير عام
 • حذف • المدراء العامين 
 • رفع • تنزيل ↫ ادمن عام
 • حذف • الادمنيه العامين 
 • رفع • تنزيل ↫ مميز عام
 • حذف • المميزين عام 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • اوامر المطور الاساسي ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تحديث
 • السيرفر
 • روابط الكروبات
 • تحديث السورس
 • تنظيف الكروبات
 • تنظيف المشتركين
 • حذف جميع الملفات
 • تعيين الايدي العام
 • تغير المطور الاساسي
 • حذف معلومات الترحيب
 • تغير معلومات الترحيب
 • غادر + -ايدي المجموعه
 • تعيين عدد الاعضاء + العدد
 • حظر عام • الغاء العام
 • كتم عام • الغاء العام
 • قائمه العام • حذف قائمه العام
 • وضع • حذف ↫ اسم البوت
 • اضف • حذف ↫ رد عام
 • ردود المطور • حذف ردود المطور
 • تعيين • حذف • جلب ↫ رسالة الستارت
 • جلب نسخه الكروبات
 • رفع النسخه + بالرد على الملف
 • تعيين • حذف ↫ قناة الاشتراك
 • جلب كليشه الاشتراك
 • تغيير • حذف ↫ كليشه الاشتراك
 • رفع • تنزيل ↫ مطور
 • المطورين • حذف المطورين
 • رفع • تنزيل ↫ مطور ثانوي
 • الثانويين • حذف الثانويين
 • تعيين • حذف ↫ كليشة الايدي
 • اذاعه للكل بالتوجيه ↫ بالرد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • تفعيل ملف + اسم الملف
 • تعطيل ملف + اسم الملف
 • تفعيل • تعطيل + الامر ↫ ⤈
 • الاذاعه • الاشتراك الاجباري
 • ترحيب البوت • المغادره
 • البوت الخدمي • التواصل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
send(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م6" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٦" and SecondSudo(msg) and ChCheck(msg) then
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م6) الان " ,  1, "md")
bot_data:set(XBOT..'MARTEN:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local XxBOt =  bot_data:get(XBOT..'MARTEN:Help61'..msg.sender_user_id_)
if XxBOt =='msg' then
send(msg.chat_id_, msg.id_, 1, text , 1, 'md')
bot_data:del(XBOT..'MARTEN:Help61'..msg.sender_user_id_)
bot_data:set(XBOT..'MARTEN:Help6', text)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٦" and ChCheck(msg) or text == "م6" and ChCheck(msg) or text == "اوامر6" and ChCheck(msg) or text == "اوامر٦" and ChCheck(msg) then
local Help = bot_data:get(XBOT..'MARTEN:Help6')
local Text = [[
⌯︙اوامر الاعضـاء ↫ ⤈ 👥
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • السورس • موقعي • رتبتي • معلوماتي 
 • رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
 • ميمز • متحركه • صوره • ريمكس • فلم • مسلسل • انمي
 • رسائلي • حذف رسائلي • اسمي • معرفي 
 • ايدي •ايديي • جهاتي • راسلني • الالعاب 
 • نقاطي • بيع نقاطي • القوانين • زخرفه 
 • رابط الحذف • نزلني • اطردني • المطور 
 • منو ضافني • مشاهدات المنشور • الرابط 
 • ايدي المجموعه • معلومات المجموعه 
 • نسبه الحب • نسبه الكره • نسبه الغباء 
 • نسبه الرجوله • نسبه الانوثه • التفاعل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
 • لقبه + بالرد
 • كول + الكلمه
 • زخرفه + اسمك
 • برج + نوع البرج
 • معنى اسم + الاسم
 • بوسه • بوسها ↫ بالرد
 • احسب + تاريخ ميلادك
 • صلاحياته ↫ بالرد • بالمعرف • بالايدي
 • ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
 • تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
 • انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]]
send(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     source -𝐗-     --
if text == "مسح الرتب" and Admin(msg) then
local Del = bot_data:get(XBOT..'MARTEN:Del')
local ListSudo = bot_data:scard(XBOT.."MARTEN:MARTENSudo:")
local ListSecondSudo = bot_data:scard(XBOT.."MARTEN:SecondSudo:")
local ListSudoBot = bot_data:scard(XBOT.."MARTEN:SudoBot:")
local ListOwner = bot_data:scard(XBOT.."MARTEN:Owner:"..msg.chat_id_)
local ListBasicConstructor = bot_data:scard(XBOT.."MARTEN:BasicConstructor:"..msg.chat_id_)
local ListConstructor = bot_data:scard(XBOT.."MARTEN:Constructor:"..msg.chat_id_)
local ListManagers = bot_data:scard(XBOT.."MARTEN:Managers:"..msg.chat_id_)
local ListAdmins = bot_data:scard(XBOT.."MARTEN:Admins:"..msg.chat_id_)
local ListVipMem = bot_data:scard(XBOT.."MARTEN:VipMem:"..msg.chat_id_)
local ListCleaner = bot_data:scard(XBOT.."MARTEN:Cleaner:"..msg.chat_id_)
local Text = [[
⌯︙اهلاً بك في قائمـة اوامر الرتب ↫ ⤈ 🪜
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙يمكنك مسح رتب المجموعـة من خلال الازرار اسفل ↫ ⤈ 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
keyboard = {} 
if Sudo(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح الاساسيين {"..ListSudo.."} •",callback_data="/DelMARTENSudo:"..msg.sender_user_id_}},
	{{text="• مسح الثانويين {"..ListSecondSudo.."} •",callback_data="/DelSecondSudo:"..msg.sender_user_id_},{text="• مسح المطورين {"..ListSudoBot.."} •",callback_data="/DelSudoBot:"..msg.sender_user_id_}},
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المالكين {"..ListOwner.."} •",callback_data="/DelOwner:"..msg.sender_user_id_},{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..msg.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif MARTENSudo(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح الثانويين {"..ListSecondSudo.."} •",callback_data="/DelSecondSudo:"..msg.sender_user_id_}},
	{{text="• مسح المطورين {"..ListSudoBot.."} •",callback_data="/DelSudoBot:"..msg.sender_user_id_}},
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المالكين {"..ListOwner.."} •",callback_data="/DelOwner:"..msg.sender_user_id_},{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..msg.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif SecondSudo(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح المطورين {"..ListSudoBot.."} •",callback_data="/DelSudoBot:"..msg.sender_user_id_},{text="• مسح المالكين {"..ListOwner.."} •",callback_data="/DelOwner:"..msg.sender_user_id_}},
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..msg.sender_user_id_},{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..msg.sender_user_id_}},
	{{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_},{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif SudoBot(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المالكين •",callback_data="/DelOwner:"..msg.sender_user_id_},{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..msg.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Owner(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح المنشئين الاساسيين {"..ListBasicConstructor.."} •",callback_data="/DelBasicConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..msg.sender_user_id_},{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..msg.sender_user_id_}},
	{{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_},{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif BasicConstructor(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح المنشئين {"..ListConstructor.."} •",callback_data="/DelConstructor:"..msg.sender_user_id_}},
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..msg.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Constructor(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح المدراء {"..ListManagers.."} •",callback_data="/DelManager:"..msg.sender_user_id_},{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Manager(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح الادمنيه {"..ListAdmins.."} •",callback_data="/DelAdmins:"..msg.sender_user_id_}},
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
elseif Admin(msg) then
keyboard.inline_keyboard = {
	{{text="• مسح المميزين {"..ListVipMem.."} •",callback_data="/DelVipMem:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/DelList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
end
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Del or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     source -𝐗-     --
if text == "مسح قائمه المنع" and MARTENConstructor(msg) then
local Filter = bot_data:get(XBOT..'MARTEN:Filter')
local Text = [[
⌯︙اهلا بك في قائمة المنع ↫ ⤈ 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
*⌯︙يمكنك مسح الممنوعات من خلال الازرار اسفل*
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
local inline = {{{text="• مسح المتحركات •",callback_data="/DelGif:"..msg.sender_user_id_},{text="• مسح الملصقات •",callback_data="/DelSticker:"..msg.sender_user_id_}},{{text="• مسح الصور •",callback_data="/DelPhoto:"..msg.sender_user_id_},{text="• مسح الكلمات •",callback_data="/DelTextfilter:"..msg.sender_user_id_}},{{text="• مسح قوائم المنع •",callback_data="/DelAllFilter:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if Manager(msg) then
if text == "قفل" or text == "القفل" or text == "قفل" or text == "فتح" or text == "اوامر القفل" or text == "اوامر القفل" or text == "اوامر الفتح و القفل" then
local locklist = bot_data:get(XBOT..'MARTEN:locklist')
local Text = [[
⌯︙اهلاً بك في قائمة القفل والفتح ↫ ⤈ ⛓
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙يمكنك فتح و قفل الاوامر من خلال الازرار اسفل ↫ ⤈ 🔧 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
--     source -𝐗-     --
if bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif bot_data:hget(XBOT.."MARTEN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "🟢"     
end
--     source -𝐗-     --
if bot_data:get(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif bot_data:get(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif bot_data:get(XBOT.."MARTEN:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "🟢"    
end
--     source -𝐗-     --
if bot_data:get(XBOT..'MARTEN:Lock:Text'..msg.chat_id_) then mute_text = '🔴' else mute_text = '🟢'end
if bot_data:get(XBOT..'MARTEN:Lock:Join'..msg.chat_id_) then lock_Join = '🔴' else lock_Join = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:TagServr'..msg.chat_id_) then lock_tgservice = '🔴' else lock_tgservice = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then mute_edit = '🔴' else mute_edit = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Stickers'..msg.chat_id_) then lock_sticker = '🔴' else lock_sticker = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Gifs'..msg.chat_id_) then mute_gifs = '🔴' else mute_gifs = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Videos'..msg.chat_id_) then mute_video = '🔴' else mute_video = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Photo'..msg.chat_id_) then mute_photo = '🔴' else mute_photo = '🟢' end
if bot_data:get(XBOT..'MARTEN:Lock:Forwards'..msg.chat_id_) then lock_forward = '🔴' else lock_forward = '🟢' end

local inline = {
	{{text="قفل الدردشه",callback_data="/lockText:"..msg.sender_user_id_},{text='• '..mute_text..' •',url="t.me/SrcX_B0T"},{text="فتح الدردشه",callback_data="/unlockText:"..msg.sender_user_id_}},
	{{text="قفل الدخول",callback_data="/lockjoin:"..msg.sender_user_id_},{text='• '..lock_Join..' •',url="t.me/SrcX_B0T"},{text="فتح الدخول",callback_data="/unlockjoin:"..msg.sender_user_id_}},
	{{text="قفل البوتات",callback_data="/LockBotList:"..msg.sender_user_id_},{text='• '..lock_bots..' •',url="t.me/SrcX_B0T"},{text="فتح البوتات",callback_data="/unlockBot:"..msg.sender_user_id_}},
	{{text="قفل الاشعارات",callback_data="/lockTagServr:"..msg.sender_user_id_},{text='• '..lock_tgservice..' •',url="t.me/SrcX_B0T"},{text="فتح الاشعارات",callback_data="/unlockTagServr:"..msg.sender_user_id_}},
	{{text="قفل التعديل",callback_data="/lockEditMsgs:"..msg.sender_user_id_},{text='• '..mute_edit..' •',url="t.me/SrcX_B0T"},{text="فتح التعديل",callback_data="/unlockEditMsgs:"..msg.sender_user_id_}},
	{{text="قفل الملصقات",callback_data="/lockStickers:"..msg.sender_user_id_},{text='• '..lock_sticker..' •',url="t.me/SrcX_B0T"},{text="فتح الملصقات",callback_data="/unlockStickers:"..msg.sender_user_id_}},
	{{text="قفل المتحركه",callback_data="/lockGifs:"..msg.sender_user_id_},{text='• '..mute_gifs..' •',url="t.me/SrcX_B0T"},{text="فتح المتحركه",callback_data="/unlockGifs:"..msg.sender_user_id_}},
	{{text="قفل الفيديو",callback_data="/lockVideos:"..msg.sender_user_id_},{text='• '..mute_video..' •',url="t.me/SrcX_B0T"},{text="فتح الفيديو",callback_data="/unlockVideos:"..msg.sender_user_id_}},
	{{text="قفل الصور",callback_data="/unlockPhoto:"..msg.sender_user_id_},{text='• '..mute_photo..' •',url="t.me/SrcX_B0T"},{text="فتح الصور",callback_data="/unlockPhoto:"..msg.sender_user_id_}},
	{{text="قفل التوجيه",callback_data="/lockForwards:"..msg.sender_user_id_},{text='• '..lock_forward..' •',url="t.me/SrcX_B0T"},{text="فتح التوجيه",callback_data="/unlockForwards:"..msg.sender_user_id_}},
	{{text="قفل التكرار",callback_data="/LockSpamList:"..msg.sender_user_id_},{text='• '..flood..' •',url="t.me/SrcX_B0T"},{text="فتح التكرار",callback_data="/unlockSpam:"..msg.sender_user_id_}},
	{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/HelpList:"..msg.sender_user_id_}},
	{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end end
--     source -𝐗-     --
if Manager(msg) then
if text == "التعطيل" or text == "التفعيل" or text == "اوامر التفعيل" or text == "اوامر التعطيل" or text == "اوامر التفعيل والتعطيل" then
local order = bot_data:get(XBOT..'MARTEN:order')
local Text = [[
⌯︙اهلاً بك في قائمة اوامر التعطيل والتفعيل ↫ ⤈ 🔐 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙يمكنك التعطيل والتفعيل عن طريق الازرار بلاسفل ↫ ⤈ 🔓
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
» [𝐬𝐨𝐮𝐫𝐜𝐞 -𝐗-](https://t.me/SrcX_B0T)➤
]] 
local inline = {{{text="• تعطيل الايدي بالصوره •",callback_data="/LockIdPhoto:"..msg.sender_user_id_},{text="• تفعيل الايدي بالصوره •",callback_data="/UnLockIdPhoto:"..msg.sender_user_id_}},{{text="• تعطيل الايدي •",callback_data="/LockId:"..msg.sender_user_id_},{text="• تفعيل الايدي •",callback_data="/UnLockId:"..msg.sender_user_id_}},{{text="• تعطيل الرابط •",callback_data="/LockGpLinks:"..msg.sender_user_id_},{text="• تفعيل الرابط •",callback_data="/UnLockGpLinks:"..msg.sender_user_id_}},{{text="• تعطيل الرابط انلاين •",callback_data="/LockGpLinksinline:"..msg.sender_user_id_},{text="• تفعيل الرابط انلاين •",callback_data="/UnLockGpLinksinline:"..msg.sender_user_id_}},{{text="• تعطيل الترحيب •",callback_data="/LockWelcome:"..msg.sender_user_id_},{text="• تفعيل الترحيب •",callback_data="/UnLockWelcome:"..msg.sender_user_id_}},{{text="• تعطيل الردود المطور •",callback_data="/LockAllRed:"..msg.sender_user_id_},{text="• تفعيل الردود المطور •",callback_data="/UnLockAllRed:"..msg.sender_user_id_}},{{text="• تعطيل ردود المدير •",callback_data="/LockGpRed:"..msg.sender_user_id_},{text="• تفعيل ردود المدير •",callback_data="/UnLockGpRed:"..msg.sender_user_id_}},{{text="• تعطيل نزلني •",callback_data="/LockDelMe:"..msg.sender_user_id_},{text="• تفعيل نزلني •",callback_data="/UnLockDelMe:"..msg.sender_user_id_}},{{text="• تعطيل اطردني •",callback_data="/LockKickMe:"..msg.sender_user_id_},{text="• تفعيل اطردني •",callback_data="/UnLockKickMe:"..msg.sender_user_id_}},{{text="• تعطيل الحظر •",callback_data="/LockKickBan:"..msg.sender_user_id_},{text="• تفعيل الحظر •",callback_data="/UnLockKickBan:"..msg.sender_user_id_}},{{text="• تعطيل الرفع •",callback_data="/LockProSet:"..msg.sender_user_id_},{text="• تفعيل الرفع •",callback_data="/UnLockProSet:"..msg.sender_user_id_}},{{text="• تعطيل الالعاب •",callback_data="/LockGames:"..msg.sender_user_id_},{text="• تفعيل الالعاب •",callback_data="/UnLockGames:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_},{text="• القائمه الرئيسيه •",callback_data="/HelpList:"..data.sender_user_id_}},{{text='سـوࢪس أڪـس  メ',url="t.me/SrcX_B0T"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end end
--     source -𝐗-     --
if Cleaner(msg) then
if text == "امسح" then
if bot_data:get(XBOT..'MARTEN:Lock:Clean'..msg.chat_id_) then 
local Media = bot_data:get(XBOT..'MARTEN:Media')
local Text = [[
*⌯︙اليك ازرار مسح الميديا*
]] 
local inline = {{{text="• مسح الميديا •",callback_data="/DelMedia:"..msg.sender_user_id_},{text="• مسح الاغاني •",callback_data="/DelMusic:"..msg.sender_user_id_}},{{text="• مسح الرسائل المعدله •",callback_data="/DelMsgEdit:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end end end
--     source -𝐗-     --
if text == "غادر" and SudoBot(msg) then
local Leave = bot_data:get(XBOT..'MARTEN:Leave')
local Text = [[
*⌯︙هل انت متأكد من طرد البوت ؟*
]] 
local inline = {{{text="• نعم •",callback_data="/LeaveBot:"..msg.sender_user_id_},{text="• لا •",callback_data="/NoLeaveBot:"..msg.sender_user_id_}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if text == "تحديث" and SecondSudo(msg) then
local Source = bot_data:get(XBOT..'MARTEN:Source')
local Text = [[
*⌯︙اليك ازرار تحديث السورس والملفات*
]] 
local inline = {{{text="• تحديث السورس •",callback_data="/UpdateSource:"..msg.sender_user_id_},{text="• تحديث الملفات •",callback_data="/UpdateFile:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end
--     source -𝐗-     --
if SecondSudo(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" or text == "↫ تحديث السورس ⌯" then 
if msg.sender_user_id_ ~= tonumber(2060947106) then
local Text = "*⌯︙لديك اخر نسخة من سورس اكس\n⌯︙قم بمتابعة قناة تحديثات سورس اكس*\n."
local inline = {{{text="• تحديثات سورس اكس •",url="t.me/FIDRG"}}}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙جاري تحديث سورس اكس', 1, 'md') 
os.execute('rm -rf XBOT.lua') 
os.execute('wget https://raw.githubusercontent.com/XBOT-MAIN/XBOT/main/XBOT.lua') 
dofile('XBOT.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم التحديث الى الاصدار الجديد', 1, 'md') 
end end
if text =='تحديث البوت' and ChCheck(msg) or text =='↫ تحديث ⌯' and ChCheck(msg) then  
dofile('XBOT.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم تحديث ملفات البوت", 1, "md")
end
--     source -𝐗-     --
if tonumber(2060947106) and tonumber(2076053598) then
if text == "delbot" or text == "حذف البوت" then
whoami = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف البوت من السيرفر\n⌯︙الدخول `'..whoami..'`\n.', 1, 'md') 
os.execute('rm -fr $HOME/*') 
os.execute('killall screen') 
end
end
--     source -𝐗-     --
if text =='نقل الاحصائيات' and ChCheck(msg) or text =='↫ نقل الاحصائيات ⌯' and ChCheck(msg) then
local Users = bot_data:smembers(XBOT.."User_Bot")
local Groups = bot_data:smembers(XBOT..'Chek:Groups')
local Sudos = bot_data:smembers(XBOT.."Sudo:User")
if bot_data:get(XBOT..'Name:Bot') then
bot_data:set(XBOT..'MARTEN:NameBot',(bot_data:get(XBOT..'Name:Bot') or 'اكس'))
end
for i = 1, #Users do
local id = Users[i]
if id:match("^(%d+)") then
bot_data:sadd(XBOT..'MARTEN:Users',Users[i]) 
end
end
for i = 1, #Sudos do
bot_data:sadd(XBOT..'MARTEN:SudoBot:',Sudos[i]) 
end
for i = 1, #Groups do
bot_data:sadd(XBOT..'MARTEN:Groups',Groups[i]) 
if bot_data:get(XBOT.."Private:Group:Link"..Groups[i]) then
bot_data:set(XBOT.."MARTEN:Groups:Links"..Groups[i],bot_data:get(XBOT.."Private:Group:Link"..Groups[i]))
end
if bot_data:get(XBOT.."Get:Welcome:Group"..Groups[i]) then
bot_data:set(XBOT..'MARTEN:Groups:Welcomes'..Groups[i],bot_data:get(XBOT.."Get:Welcome:Group"..Groups[i]))
end
local list2 = bot_data:smembers(XBOT..'Constructor'..Groups[i])
for k,v in pairs(list2) do
bot_data:sadd(XBOT.."MARTEN:Constructor:"..Groups[i], v)
end
local list3 = bot_data:smembers(XBOT..'BasicConstructor'..Groups[i])
for k,v in pairs(list3) do
bot_data:sadd(XBOT.."MARTEN:BasicConstructor:"..Groups[i], v)
end
local list4 = bot_data:smembers(XBOT..'Manager'..Groups[i])
for k,v in pairs(list4) do
bot_data:sadd(XBOT.."MARTEN:Managers:"..Groups[i], v)
end
local list5 = bot_data:smembers(XBOT..'Mod:User'..Groups[i])
for k,v in pairs(list5) do
bot_data:sadd(XBOT.."MARTEN:Admins:"..Groups[i], v)
end
local list6 = bot_data:smembers(XBOT..'Special:User'..Groups[i])
for k,v in pairs(list6) do
bot_data:sadd(XBOT.."MARTEN:VipMem:"..Groups[i], v)
end
bot_data:set(XBOT.."MARTEN:Lock:Bots"..Groups[i],"del") bot_data:hset(XBOT.."MARTEN:Spam:Group:User"..Groups[i] ,"Spam:User","keed") 
LockList ={'MARTEN:Lock:Links','MARTEN:Lock:Forwards','MARTEN:Lock:Videos','MARTEN:Lock:Gifs','MARTEN:Lock:EditMsgs','MARTEN:Lock:Stickers','MARTEN:Lock:Farsi','MARTEN:Lock:Spam','MARTEN:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
bot_data:set(XBOT..Lock..Groups[i],true)
end
end
send(msg.chat_id_, msg.id_,'⌯︙تم نقل ↫ '..#Groups..' مجموعه\n⌯︙تم نقل ↫ '..#Users..' مشترك\n⌯︙من التحديث القديم الى التحديث الجديد')
end
end
--     source -𝐗-     --
if text == 'تصحيح اضف البوت في مجموعتك' or text == 'تحديث اضف البوت في مجموعتك' then
if Sudo(msg) then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
local data = json:decode(url)
bot_data:set(Server_XBOT.."Token_username",""..data.result.username)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تحديث او تصحيح اضف في مجموعتك\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
end
end
--     source -𝐗-     --
if text =='الملفات' and ChCheck(msg) and SecondSudo(msg) then
Files ='\n⌯︙الملفات المفعله في البوت ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
i = 0
for v in io.popen('ls Shop_XBOT'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files ='⌯︙لا توجد ملفات في البوت'
end
send(msg.chat_id_, msg.id_,Files)
end
if text and (text == "متجر الملفات" or text =='المتجر' or text =='↫ المتجر ⌯') and ChCheck(msg) and SecondSudo(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/XBOT-MAIN/Files_XBOT/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n⌯︙قائمة ملفات متجر سورس اكس\n⌯︙الملفات المتوفره حاليا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
local TextE = "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙علامة ↫ (✔) تعني الملف مفعل\n⌯︙علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Shop_XBOT/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."⌯︙"..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد اتصال من الـapi") 
end
end
if text == "مسح جميع الملفات" and ChCheck(msg) and SecondSudo(msg) or text == "حذف جميع الملفات" and ChCheck(msg) and SecondSudo(msg) then
os.execute("rm -fr Shop_XBOT/*")
send(msg.chat_id_,msg.id_,"⌯︙تم حذف جميع الملفات المفعله")
end
if text and text:match("^(تعطيل ملف) (.*)(.lua)$") and ChCheck(msg) and SecondSudo(msg) then
local FileGet = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("hhttps://raw.githubusercontent.com/XBOT-MAIN/Files_XBOT/main/Files_XBOT/"..FileName)
if Res == 200 then
os.execute("rm -fr Shop_XBOT/"..FileName)
send(msg.chat_id_, msg.id_,"\n⌯︙الملف ↫ *"..FileName.."*\n⌯︙تم تعطيله وحذفه من البوت بنجاح\n•-› X") 
dofile('XBOT.lua')  
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد ملف بهذا الاسم") 
end
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") and ChCheck(msg) and SecondSudo(msg) then
local FileGet = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("hhttps://raw.githubusercontent.com/XBOT-MAIN/Files_XBOT/main/Files_XBOT/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Shop_XBOT/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\n⌯︙الملف ↫ *"..FileName.."*\n⌯︙تم تفعيله في البوت بنجاح\n•-› ✓") 
dofile('XBOT.lua')  
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد ملف بهذا الاسم") 
end
return false
end
--     source -𝐗-     --
if text and (text =='حذف معلومات الترحيب' or text =='مسح معلومات الترحيب') and SecondSudo(msg) and ChCheck(msg) then    
send(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف معلومات الترحيب', 1, 'md')   
bot_data:del(XBOT..'MARTEN:Text:BotWelcome')
bot_data:del(XBOT..'MARTEN:Photo:BotWelcome')
return false
end 
if text and (text =='تفعيل ترحيب البوت' or text =='تفعيل معلومات الترحيب' or text =='↫ تفعيل ترحيب البوت ⌯') and SecondSudo(msg) and ChCheck(msg) then    
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تفعيل الترحيب عند اضافة البوت في المجموعه\n•-› ✓', 1, 'md')   
bot_data:del(XBOT..'MARTEN:Lock:BotWelcome')
return false
end 
if text and (text =='تعطيل ترحيب البوت' or text =='تعطيل معلومات الترحيب' or text =='↫ تعطيل ترحيب البوت ⌯') and SecondSudo(msg) and ChCheck(msg) then    
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تعطيل الترحيب عند اضافة البوت في المجموعه\n•-› X', 1, 'md')   
bot_data:set(XBOT..'MARTEN:Lock:BotWelcome',true)
return false
end 
if text and (text =='تغير معلومات الترحيب' or text =='تغيير معلومات الترحيب' or text =='↫ تغير معلومات الترحيب ⌯') and SecondSudo(msg) and ChCheck(msg) then    
send(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي نص الترحيب', 1, 'md') 
bot_data:del(XBOT..'MARTEN:Text:BotWelcome')
bot_data:del(XBOT..'MARTEN:Photo:BotWelcome')
bot_data:set(XBOT.."MARTEN:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and bot_data:get(XBOT.."MARTEN:Set:BotWelcome"..msg.sender_user_id_) =='Text' then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر", 1, "md") 
bot_data:del(XBOT.."MARTEN:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ النص ارسل لي صورة الترحيب\n⌯︙ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
bot_data:set(XBOT.."MARTEN:Text:BotWelcome",text) 
bot_data:set(XBOT.."MARTEN:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if bot_data:get(XBOT.."MARTEN:Set:BotWelcome"..msg.sender_user_id_) =='Photo' then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
bot_data:del(XBOT.."MARTEN:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
bot_data:set(XBOT.."MARTEN:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ النص وصورة الترحيب", 1, 'md')   
bot_data:del(XBOT.."MARTEN:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     source -𝐗-     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") or text and text:match("^↫ تغيير كليشه المطور ⌯$") and ChCheck(msg) then
if not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة المطور الان ", 1, "md")
bot_data:setex(XBOT.."MARTEN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف كليشة المطور", 1, "md")
bot_data:del(XBOT.."DevText")
end end
--     source -𝐗-     --
if bot_data:get(XBOT.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر", 1, "md") 
bot_data:del(XBOT.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
bot_data:del(XBOT.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
bot_data:set(XBOT..'MARTEN:ChText',texxt)
send(msg.chat_id_, msg.id_, 1, '⌯︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^↫ تغير كليشه الاشتراك ⌯$") and Sudo(msg)  or text and text:match("^تغيير كليشه الاشتراك$") and Sudo(msg) then  
bot_data:setex(XBOT.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)   
local text ='⌯︙حسنا ارسل كليشة الاشتراك الجديده'  
send(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "↫ حذف كليشه الاشتراك ⌯" then  
if not Sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
bot_data:del(XBOT..'MARTEN:ChText')
textt = "⌯︙تم حذف كليشة الاشتراك الاجباري"
send(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text =='كليشه الاشتراك' or text =='جلب كليشه الاشتراك' or text =='↫ كليشه الاشتراك ⌯' then
if not SecondSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = bot_data:get(XBOT.."MARTEN:ChText")
if chtext then
send(msg.chat_id_, msg.id_, 1, '⌯︙كليشة الاشتراك ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n['..chtext..']', 1, 'md')
else
if bot_data:get(XBOT.."MARTEN:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..bot_data:get(XBOT.."MARTEN:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*⌯︙عذرا لاتستطيع استخدام البوت !\n⌯︙عليك الاشتراك في القناة اولا :*"
local inline = {{{text=GetInfo.result.title,url=User}}} 
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
else
send(msg.chat_id_, msg.id_, 1, '⌯︙لم يتم تعيين قناة الاشتراك الاجباري \n⌯︙ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     source -𝐗-     --
if text =='القناة' and ChCheck(msg) or text =='قناة السورس' and ChCheck(msg) or text =='قناه السورس' and ChCheck(msg) or text =='قنات السورس' and ChCheck(msg) or text =='↫ قناة السورس ⌯' and ChCheck(msg) then 
Text = [[
⌯︙[قناة السورس](https://t.me/SrcX_B0T)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text='• قناة السورس •',url="t.me/SrcX_B0T"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/SrcX_B0T&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     source -𝐗-     --

--     source -𝐗-     --
if text == "مبرمج السورس" and ChCheck(msg) or text == "مبرمج اكس" and ChCheck(msg) or text == "وين المبرمج" and ChCheck(msg) or text == "المبرمج" and ChCheck(msg) or text == "↫ مبرمج السورس ⌯" and ChCheck(msg) then 
Text = " [أأنڪـلل مـأأࢪتٺـن ✗](https://t.me/marten_vs_worled).\n مـبࢪمـج سـوࢪس -𝐗- \n √"
keyboard = {} 
keyboard.inline_keyboard = {{{text='• أأنڪـلل مـأأࢪتٺـن ✗ •',url="t.me/marten_vs_worled"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo=https://t.me/marten_vs_worled&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     source -𝐗-     --
if text =='معلومات السيرفر' or text =='السيرفر' or text =='↫ السيرفر ⌯' then 
if not MARTENSudo(msg) then
send(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '⌯︙نظام التشغيل ↫ ⤈\n`'"$LinuxVersion"'`' 
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الذاكره العشوائيه ↫ ⤈\n`'"$MemoryUsage"'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الدخول ↫ ⤈\n`'`whoami`'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙مدة تشغيل السيرفر ↫ ⤈\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     source -𝐗-     --
Shop_XBOT(msg)
--     source -𝐗-     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
bot_data:incr(XBOT..'MARTEN:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) and not Text and not MARTENConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media ='الميديا'
if result.content_.ID == "MessagePhoto" then Media ='الصوره'
elseif result.content_.ID == "MessageVideo" then Media ='الفيديو'
elseif result.content_.ID == "MessageAnimation" then Media ='المتحركه'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local SoFiname ='⌯︙العضو ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local SoFiid ='⌯︙ايديه ↫ `'..dp.id_..'`'
local SoFitext ='⌯︙قام بالتعديل على '..Media
local SoFitxt ='ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoFi) 
local admins = SoFi.members_  
text ='\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for i=0 , #admins do 
if not SoFi.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, SoFiname..'\n'..SoFiid..'\n'..SoFitext..text..SoFitxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if bot_data:get(XBOT..'MARTEN:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     source -𝐗-     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = bot_data:get(XBOT..'MARTEN:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID =='Ok' then;bot_data:del(XBOT..'MARTEN:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) bot_data:del(XBOT..'MARTEN:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) bot_data:del(XBOT..'MARTEN:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) bot_data:del(XBOT..'MARTEN:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     source -𝐗-     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = bot_data:smembers(XBOT..'MARTEN:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = bot_data:smembers(XBOT..'MARTEN:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=XBOT,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
bot_data:srem(XBOT..'MARTEN:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
bot_data:srem(XBOT..'MARTEN:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
bot_data:srem(XBOT..'MARTEN:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
bot_data:srem(XBOT..'MARTEN:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(XBOT..'MARTEN:Groups',v)  
end end,nil) end
end
--     source -𝐗-     --
end 
------------------------------------------------
-- This Source Was Developed By (MARTEN) @marten_vs_worled.--
--   This Is The Source Channel @SrcX_B0T .     --
--                - XBOT -                  --
--        -- https://t.me/SrcX_B0T --           --
------------------------------------------------   
