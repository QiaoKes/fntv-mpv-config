--[[
MIT License

Copyright (c) 2025 Tag mig hånden

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

GitHub: https://github.com/QiaoKes/fntv-mpv-config
]]


local mp         = require "mp"
local utils      = require "mp.utils"
local msg        = require "mp.msg"

-- 检测模式映射
local DETECT_MODE = {
    CHAPTER = 1, -- 通过章节检测片头片尾
    MANUAL = 2,  -- 通过手动指定片头片尾
    AUTO = 3     -- 先通过章节检测，再通过手动指定检测
}

-- 配置选项定义
_G.opts = {
    -- 基础设置
    enabled = false,
    detect_mode = DETECT_MODE.AUTO, -- auto, chapter, manual, content

    -- 章节检测参数
    min_skip_duration = 10,  -- 最短片头/片尾长度s
    max_skip_duration = 150, -- 最长片头/片尾长度s
    max_scan_window = 600,   -- 最大扫描窗口（10分钟）
    max_scan_percent = 25,   -- 视频长度百分比

    -- 手动指定片头片尾时间, 从服务器获取，不允许在配置文件设置
    manual_intro_start = 0,
    manual_intro_end = 0,
    manual_outro_start = 0,
    manual_outro_end = 0,

    -- 手动触发跳过时长
    manual_skip_duration = 90,
}

return {
    opts = _G.opts,
    DETECT_MODE = DETECT_MODE
}