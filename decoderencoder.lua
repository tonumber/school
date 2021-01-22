function decode(s)
   s = s:lower()
   local iteration = 1
   local fin = {}
   local act = {}
   local fins = ""

   for i = 1,s:len() do
      c = s:sub(i,i)
      if c == "t" then
      fins = fins.."a"
      elseif c == "g" then
      fins = fins.."c"
      elseif c == "c" then
      fins = fins.."g"
      elseif c == "a" then
      fins = fins.."u"
      elseif c == "v" then
      fins = fins.."s"
      end
   end
   for i = 1,fins:len() do 
      local val = string.sub(fins, iteration,iteration+2)
      iteration = iteration+3
      table.insert(fin, val)
      
   end
   local fisnt = ""
   for i,v in pairs(fin) do
      if v == "sss" then fisnt=fisnt.."v" end
      if v == "uuu" or v == "uuc" then fisnt = fisnt.."j" elseif v == "uua" or v == "uug" or v == "cuu" or v == "cuc" or v == "cua" or v == "cug" then fisnt = fisnt.."g" elseif v == "auu" or v == "auc" or v == "aua" then fisnt = fisnt.."e" elseif v == "aug" then fisnt = fisnt.."y" elseif v == "guu" or v == "guc" or v == "gua" or v == "gug" then fisnt = fisnt.."k" elseif v == "ucu" or v == "ucc" or v == "uca" or v == "ucg" then fisnt = fisnt.."h" elseif v == "ccu" or v == "ccc" or v == "cca" or v == "ccg" then fisnt = fisnt.."l" elseif v == "acu" or v == "acc" or v == "aca" or v == "acg" then fisnt = fisnt.."i" elseif v == "gcu" or v == "gcc" or v == "gca" or v == "gcg" then fisnt = fisnt.."b" elseif v == "uau" or v == "uac" then fisnt = fisnt.."m" elseif v == "uaa" or v == "uag" or v == "uga" then fisnt = fisnt.."." elseif v == "cau" or v == "cac" then fisnt = fisnt.."f" elseif v == "caa" or v == "cag" then fisnt = fisnt.."u" elseif v == "aau" or v == "aac" then fisnt = fisnt.."t" elseif v == "aaa" or v == "aag" then fisnt = fisnt.."r" elseif v == "gau" or v == "gac" then fisnt = fisnt.."n" elseif v == "gaa" or v == "gag" then fisnt = fisnt.."o" elseif v == "ugu" or v == "ugc" then fisnt = fisnt.."w" elseif v == "ugg" then fisnt = fisnt.."d" elseif v == "cgu" or v == "cgc" or v == "cga" or v == "cgg" then fisnt = fisnt.."s" elseif v == "agu" or v == "agc" or v =="aga" or v == "agg" then fisnt = fisnt.."s" elseif v == "ggu" or v == "ggc" or v == "gga" or v == "ggg" then fisnt = fisnt.."a" end

   end
 
   return(fisnt)
end

function encode(s)
   local conversion = {
    ["a"]="gga",
    ["b"]="gca",
    ["c"]="gug",
    ["d"]="ugg",
    ["e"]="aua",
    ["f"]="cac",
    ["g"]="cug",
    ["h"]="ucg",
    ["i"]="acg",
    ["j"]="uuc",
    ["k"]="gug",
    ["l"]="ccg",
    ["m"]="uac",
    ["n"]="gac",
    ["o"]="gag",
    ["r"]="aag",
    ["s"]="agg",
    ["t"]="aac",
    ["u"]="cag",
    ["w"]="ugc",
    ["y"]="aug",
    ["."]="uga",
    ["v"]="sss"
   }
   s = tostring(s)
   if s:sub(1,3) then 
   local fint = {}
   local ft = {}
      for i = 1,s:len() do
         local char = s:sub(i,i)
         table.insert(fint, char)
         
      end
      local endstr = ""
      for i = 1,#fint do
          local char = tostring(fint[i])
          if char then
             if conversion[char] then

                local conv = conversion[char]
                 for i = 1,conv:len() do
                    local c = string.sub(conv, i,i)
                    if c == "a" then
                    endstr = endstr.."t"
                    elseif c == "c" then
                    endstr = endstr.."g"
                    elseif c == "g" then
                    endstr = endstr.."c"
                    elseif c == "u" then
                    endstr = endstr.."a"
                    elseif c == "s" then
                    endstr = endstr.."v"
                    end

                 end
             end
          end
      end
      
      return(endstr)
   else
   return("needs to be atleast 3 characters long thanks")
   end
end
local decoded = decode("ttgtattccttgtgcctggac")
print(decoded)
print(encode("testing"))

--[[
   Working Characters for Encoding:
   local conversion = {
    ["a"]="gga",
    ["b"]="gca",
    ["c"]="gug",
    ["d"]="ugg",
    ["e"]="aua",
    ["f"]="cac",
    ["g"]="cug",
    ["h"]="ucg",
    ["i"]="acg",
    ["j"]="uuc",
    ["k"]="gug",
    ["l"]="ccg",
    ["m"]="uac",
    ["n"]="gac",
    ["o"]="gag",
    ["r"]="aag",
    ["s"]="agg",
    ["t"]="aac",
    ["u"]="cag",
    ["w"]="ugc",
    ["y"]="aug",
    ["."]="uga",
    ["v"]="sss"
   }
   (v is just added on because i wanted to do encode the word vahle. but its not really accurate.)
]]
