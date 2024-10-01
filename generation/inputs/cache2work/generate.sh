# UINT8

work2cache ../work2cache/original_gray_uint8.tif -c none SLAB_GRAY_RAW_UINT8.tif -t 20 20
work2cache ../work2cache/original_graya_uint8.tif -c none SLAB_GRAYA_RAW_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgb_uint8.tif -c none SLAB_RGB_RAW_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgba_uint8.tif -c none SLAB_RGBA_RAW_UINT8.tif -t 20 20

work2cache ../work2cache/original_rgb_uint8.tif -c jpg SLAB_RGB_JPG_UINT8.tif -t 20 20

work2cache ../work2cache/original_rgb_uint8.tif -c jpg90 SLAB_RGB_JPG90_UINT8.tif -t 20 20

work2cache ../work2cache/original_gray_uint8.tif -c lzw SLAB_GRAY_LZW_UINT8.tif -t 20 20
work2cache ../work2cache/original_graya_uint8.tif -c lzw SLAB_GRAYA_LZW_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgb_uint8.tif -c lzw SLAB_RGB_LZW_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgba_uint8.tif -c lzw SLAB_RGBA_LZW_UINT8.tif -t 20 20

work2cache ../work2cache/original_gray_uint8.tif -c pkb SLAB_GRAY_PKB_UINT8.tif -t 20 20
work2cache ../work2cache/original_graya_uint8.tif -c pkb SLAB_GRAYA_PKB_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgb_uint8.tif -c pkb SLAB_RGB_PKB_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgba_uint8.tif -c pkb SLAB_RGBA_PKB_UINT8.tif -t 20 20

work2cache ../work2cache/original_gray_uint8.tif -c zip SLAB_GRAY_ZIP_UINT8.tif -t 20 20
work2cache ../work2cache/original_graya_uint8.tif -c zip SLAB_GRAYA_ZIP_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgb_uint8.tif -c zip SLAB_RGB_ZIP_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgba_uint8.tif -c zip SLAB_RGBA_ZIP_UINT8.tif -t 20 20

work2cache ../work2cache/original_gray_uint8.tif -c png SLAB_GRAY_PNG_UINT8.tif -t 20 20
work2cache ../work2cache/original_graya_uint8.tif -c png SLAB_GRAYA_PNG_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgb_uint8.tif -c png SLAB_RGB_PNG_UINT8.tif -t 20 20
work2cache ../work2cache/original_rgba_uint8.tif -c png SLAB_RGBA_PNG_UINT8.tif -t 20 20

# FLOAT32

work2cache ../work2cache/original_gray_float32.tif -c none SLAB_GRAY_RAW_FLOAT32.tif -t 20 20
work2cache ../work2cache/original_gray_float32.tif -c lzw SLAB_GRAY_LZW_FLOAT32.tif -t 20 20
work2cache ../work2cache/original_gray_float32.tif -c pkb SLAB_GRAY_PKB_FLOAT32.tif -t 20 20
work2cache ../work2cache/original_gray_float32.tif -c zip SLAB_GRAY_ZIP_FLOAT32.tif -t 20 20

dd if=gzip-without-header of=zbil_gray.bil bs=1 count=$[ `stat -c '%s' gzip-without-header` - 8 ]