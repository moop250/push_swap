# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hlibine <hlibine@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/04 14:40:48 by hlibine           #+#    #+#              #
#    Updated: 2024/04/25 16:44:33 by hlibine          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap

CC = gcc
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs
RM = rm -f
LIBFT = Libft/
BONUS = checker

SRCS = scrs/push_swap.c \

SUPP = scrs/ps_checker_ops_0.c \
		scrs/ps_checker_ops_1.c \
		scrs/ps_checks.c \
		scrs/ps_exit.c \
		scrs/ps_lstfuncs_0.c \
		scrs/ps_lstfuncs_1.c \
		scrs/ps_lstwrk.c \
		scrs/ps_operations_0.c \
		scrs/ps_operations_1.c \
		scrs/ps_operations_2.c \
		scrs/ps_solver_ops_0.c \
		scrs/ps_solver_ops_1.c \
		scrs/ps_sort.c \

BONUS_SRCS = bonus/checker.c \
		bonus/get_next_line/get_next_line.c \
		bonus/get_next_line/get_next_line_utils.c \

INCLUDE = -L ./Libft -lft

GREEN = \033[0;32m
ORANGE = \033[38;5;208m
RESET = \033[0m

$(NAME): $(SUPP) $(SRCS)
	@echo "$(ORANGE)Building libft$(RESET)"
	@make -s -C ${LIBFT}
	@echo "$(GREEN)libft built$(RESET)"
	@echo "$(ORANGE)Compiling $(NAME)...$(RESET)"
	@$(CC) $(SUPP) $(SRCS) $(MINILIBX) $(CFLAGS) -o $(NAME) ${INCLUDE}
	@echo "$(GREEN)$(NAME) built successfully!$(RESET)"

$(BONUS): $(SUPP) $(BONUS_SRCS)
	@echo "$(ORANGE)Building libft$(RESET)"
	@make -s -C ${LIBFT}
	@echo "$(GREEN)libft built$(RESET)"
	@echo "$(ORANGE)Compiling $(BONUS)...$(RESET)"
	@$(CC) $(SUPP) $(BONUS_SRCS) $(MINILIBX) $(CFLAGS) -o $(BONUS) ${INCLUDE}
	@echo "$(GREEN)$(BONUS) built successfully!$(RESET)"

all: ${NAME} ${BONUS}

bonus: ${BONUS}

clean:
		@echo "$(ORANGE)Cleaning up$(RESET)"
		@cd $(LIBFT) && $(MAKE) -s clean
		@echo "$(GREEN)Clean up successful$(RESET)"

fclean: clean
		@echo "$(ORANGE)Full clean up$(RESET)"
		@${RM} ${NAME} ${BONUS}
		@cd $(LIBFT) && $(MAKE) -s fclean
		@echo "$(GREEN)Full clean up successful$(RESET)"

re: fclean all



.PHONY: all clean fclean re bonus