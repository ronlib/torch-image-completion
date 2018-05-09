-- require("wx")
require("os")
require 'torch'
require 'patch2vec'
-- luainpaint = require("luainpaint")
nnluainpaint = require("libpatchmatch2")
patch2vec_init('model16_570.t7')
-- result_file_path = luainpaint.inpaint('image.bmp', 'mask.bmp')
-- nn_ab = nnluainpaint.nn('a.bmp', 'c.bmp', 'cpu', 16, 5)
-- nn_ba = nnluainpaint.nn('c.bmp', 'a.bmp', 'cpu', 16, 5)
nn_ab = nnluainpaint.nn('image.bmp', -- A_file_path
												'image.bmp', -- B_file_path
												'cpu',
												16,
												5,
												nil, nil, nil, nil, nil,
												'mask.bmp', -- 1 means a maksed pixel
												'mask.bmp' -- 1 means a maksed pixel
                        )
result_file_path = nnluainpaint.vote('image.bmp', nn_ab, nil, 'cpu', 16,
																		 'mask_inv.bmp', nil, nil, nil, nil,
																		 'mask_inv.bmp')
print("Result file path: " .. result_file_path)
