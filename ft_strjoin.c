/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mohammoh <mohammoh@student.42abudhabi.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/03 14:22:56 by mohammoh          #+#    #+#             */
/*   Updated: 2023/07/06 16:34:31 by mohammoh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	unsigned int	tot_len;
	char			*joined;

	if (!s1 || !s2)
		return (0);
	tot_len = ft_strlen((char *)s1) + ft_strlen((char *)s2);
	joined = (char *)malloc(sizeof(char) * (tot_len + 1));
	if (!joined)
		return (0);
	ft_strcpy(joined, (char *)s1);
	ft_strcat(joined, (char *)s2);
	joined[tot_len] = '\0';
	return (joined);
}
