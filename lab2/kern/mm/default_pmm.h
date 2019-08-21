#ifndef __KERN_MM_DEFAULT_PMM_H__
#define  __KERN_MM_DEFAULT_PMM_H__

#include <pmm.h>

extern const struct pmm_manager default_pmm_manager;

static void 
insert2free_list(list_entry_t *elem);

#endif /* ! __KERN_MM_DEFAULT_PMM_H__ */

