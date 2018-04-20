require("wx")
require("os")
require 'torch'
-- luainpaint = require("luainpaint")
nnluainpaint = require("libpatchmatch2")
-- patch2vec_init('model16_570.t7')
-- result_file_path = luainpaint.inpaint('image.bmp', 'mask.bmp')
-- nn_ab = nnluainpaint.nn('a.bmp', 'c.bmp', 'cpu', 16, 5)
-- nn_ba = nnluainpaint.nn('c.bmp', 'a.bmp', 'cpu', 16, 5)
nn_ab = nnluainpaint.nn('image.bmp', 'image.bmp', 'cpu', 16, 5)
result_file_path = nnluainpaint.vote('image.bmp', nn_ab, nil, 'cpu', 16,
																		 'mask.bmp', nil, nil, nil, nil,
																		 'mask.bmp')
print("Result file path: " .. result_file_path)
