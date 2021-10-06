package dxgi

Swap_Chain_Flags :: enum u32 {
    None                                   = 0,
    Non_Prerotated                         = 1,
    Allow_Mode_Switch                      = 2,
    Gdi_Compatible                         = 4,
    Restricted_Content                     = 8,
    Restrict_Shared_Resource_Driver        = 16,
    Display_Only                           = 32,
    Frame_Latency_Waitable_Object          = 64,
    Foreground_Layer                       = 128,
    Fullscreen_Video                       = 256,
    Yuv_Video                              = 512,
    HW_Protected                           = 1024,
    Allow_Tearing                          = 2048,
    Restricted_To_All_Holographic_Displays = 4096,
}

Swap_Chain_Desc_1 :: struct {
    width        : u32,
    height       : u32,
    format       : Format,
    stereo       : b32,
    sample_desc  : Sample_Desc,
    buffer_usage : Buffer_Usage,
    buffer_count : u32,
    scaling      : Scaling,
    swap_effect  : Swap_Effect,
    alpha_mode   : Alpha_Mode,
    flags        : Swap_Chain_Flags,
}

Swap_Chain_Fullscreen_Desc :: struct {
    // TODO
}

Swap_Chain :: struct {
    vtbl : ^Swap_Chain_Vtbl,
}

Swap_Chain_Vtbl :: struct {
    query_interface             : rawptr,
    add_ref                     : rawptr,
    release                     : proc "std" (swap_chain: ^Swap_Chain) -> u32,
    set_private_data            : rawptr,
    set_private_data_interface  : rawptr,
    get_private_data            : rawptr,
    get_parent                  : rawptr,
    get_device                  : rawptr,
    present                     : proc "std" (swap_chain: ^Swap_Chain, sync_interval: u32, flags: Present_Flags) -> Hresult,
    get_buffer                  : proc "std" (swap_chain: ^Swap_Chain, buffer_index: u32, riid: Guid, buffer: ^rawptr) -> Hresult,
    set_fullscreen_state        : rawptr,
    get_fullscreen_state        : rawptr,
    get_desc                    : rawptr,
    resize_buffers              : proc "std" (swap_chain: ^Swap_Chain, buffer_count: u32, width: u32, height: u32, format: Format, Swap_Chain_Flags: Swap_Chain_Flags) -> Hresult,
    resize_target               : rawptr,
    get_containing_output       : rawptr,
    get_frame_statistics        : rawptr,
    getLast_present_count       : rawptr,
    get_desc_1                  : rawptr,
    get_fullscreen_desc         : rawptr,
    get_hwnd                    : rawptr,
    get_coreWindow              : rawptr,
    present_1                   : rawptr,
    is_temporary_mono_supported : rawptr,
    get_restrict_to_output      : rawptr,
    set_background_color        : rawptr,
    get_background_color        : rawptr,
    set_rotation                : rawptr,
    get_rotation                : rawptr,
}

get_swap_chain_buffer :: proc(swap_chain: ^Swap_Chain, buffer_index: u32, riid: Guid, buffer: ^rawptr) -> Hresult {
    return swap_chain.vtbl.get_buffer(swap_chain, buffer_index, riid, buffer)
}

present :: proc(swap_chain: ^Swap_Chain, sync_interval: u32, flags: Present_Flags) -> Hresult  {
    return swap_chain.vtbl.present(swap_chain, sync_interval, flags)
}

release_swap_chain :: proc(swap_chain: ^Swap_Chain) -> u32 {
    return swap_chain.vtbl.release(swap_chain)
}

resize_buffers :: proc(swap_chain: ^Swap_Chain, buffer_count: u32, width: u32, height: u32, format: Format, Swap_Chain_Flags: Swap_Chain_Flags) -> Hresult {
    return swap_chain.vtbl.resize_buffers(swap_chain, buffer_count, width, height, format, Swap_Chain_Flags)
}