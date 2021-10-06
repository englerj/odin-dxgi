package dxgi

import "core:sys/win32"

Factory :: struct {
    vtbl : ^Factory_Vtbl,
}

Factory_Vtbl :: struct {
    query_interface                   : rawptr,
    add_ref                           : rawptr,
    release                           : proc "std" (factory : ^Factory) -> u32,
    set_private_data                  : rawptr,
    set_private_data_interface        : rawptr,
    getPrivate_data                   : rawptr,
    getParent                         : rawptr,
    enum_adapters                     : rawptr,
    make_window_association           : rawptr,
    get_window_association            : rawptr,
    create_swap_chain                 : rawptr,
    create_software_adapter           : rawptr,
    enum_adapters_1                   : rawptr,
    is_current                        : rawptr,
    is_windowed_stereo_enabled        : rawptr,
    create_swap_chain_for_hwnd        : proc "std" (factory: ^Factory, device: rawptr, hwnd: win32.Hwnd, desc: ^Swap_Chain_Desc_1, fullscreen_desc: ^Swap_Chain_Fullscreen_Desc, restrict_to_output: ^Output, swap_chain: ^^Swap_Chain) -> Hresult,
    create_swap_chain_for_core_window : rawptr,
    get_shared_resource_adapter_luid  : rawptr,
    register_stereo_status_window     : rawptr,
    register_stereo_status_event      : rawptr,
    unregister_stereo_status          : rawptr,
    register_occlusion_status_window  : rawptr,
    register_occlusion_status_event   : rawptr,
    unregister_occlusion_status       : rawptr,
    create_swap_chain_for_composition : rawptr,
}

release_factory :: proc(factory : ^Factory) -> u32 { 
    return factory.vtbl.release(factory)
}

create_swap_chain_for_hwnd :: proc(factory: ^Factory, device: rawptr, hwnd: win32.Hwnd, desc: ^Swap_Chain_Desc_1, fullscreen_desc: ^Swap_Chain_Fullscreen_Desc, restrict_to_output: ^Output, swap_chain: ^^Swap_Chain) -> Hresult {
    return factory.vtbl.create_swap_chain_for_hwnd(factory, device, hwnd, desc, fullscreen_desc, restrict_to_output, swap_chain)
}