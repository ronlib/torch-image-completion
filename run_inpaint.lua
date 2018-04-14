require("wx")
require("os")
require 'torch'
luainpaint = require("luainpaint")
nnluainpaint = require("libpatchmatch2")
patch2vec_init('model16_570.t7')
-- result_file_path = luainpaint.inpaint('image.bmp', 'mask.bmp')
result_file_path = nnluainpaint.inpaint('image.bmp', 'mask.bmp')
print("Result file path: " .. result_file_path)
