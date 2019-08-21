#ifndef __KERN_MM_DEFAULT_PMM_H__
#define  __KERN_MM_DEFAULT_PMM_H__

#include <pmm.h>

extern const struct pmm_manager default_pmm_manager;

/* search for a proper positon in free_list to place new memory block*/
static void 
insert2free_list(list_entry_t *elem){
	list_entry_t *le = &free_list;
    while((le = list_next(le)) != &free_list){
        if(elem < le){
            list_add_before(le, elem);
            break;
        }
    }
    if(le == &free_list) list_add_before(le, elem);
}

#endif /* ! __KERN_MM_DEFAULT_PMM_H__ */

