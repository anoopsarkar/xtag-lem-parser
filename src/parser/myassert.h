
/* myassert - handle assertions in code, can be switched off for efficiency  */

/* Copyright (c) 2000 Anoop Sarkar
 *
 * This source code is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License 
 * as published by the Free Software Foundation; either version 2 of 
 * the License, or (at your option) any later version. 
 * 
 * The file COPYING in the current directory has a copy of the GPL. 
 *
 * This code comes WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
**/

#ifndef _MYASSERT_H
#define _MYASSERT_H

#include <assert.h>

#ifdef USE_ASSERT
#define myassert(stmt)  assert(stmt);
#else
#define myassert(stmt)  
#endif

#endif /* _MYASSERT_H */
